import 'package:commerceapp/Config/constants/colors.dart';
import 'package:commerceapp/Config/constants/image_paths.dart';
import 'package:commerceapp/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:commerceapp/features/cart/presentation/pages/card_page.dart';
import 'package:commerceapp/features/favorites/presentation/bloc/favorites_bloc.dart';
import 'package:commerceapp/features/home/presentation/bloc/home_bloc.dart';
import 'package:commerceapp/features/layout/cubits/bottom_cubit/bottom_nav_cubit.dart';
import 'package:commerceapp/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:commerceapp/features/settings/presentation/pages/Profile/profile.dart';
import 'package:commerceapp/features/categories/presentation/pages/category_page.dart';
import 'package:commerceapp/features/favorites/presentation/pages/favorite_page.dart';
import 'package:commerceapp/features/home/presentation/pages/home_page.dart';
import 'package:commerceapp/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:commerceapp/service_locator.dart' as di;

class AppLayout extends StatefulWidget {
  const AppLayout({super.key});

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context)
      ..add(GetHomeDataEvent())
      ..add(GetCategoriesEvent());
    BlocProvider.of<SettingsBloc>(context)..add(GetProfileEvent());
    super.initState();
  }

  final List<Widget> screens = [
    HomePage(),
    CategoryPage(),
    BlocProvider(
      create: (context) => di.sl<CartBloc>()..add(GetAllCarts()),
      child: CardPage(),
    ),
    BlocProvider(
      create: (context) => di.sl<FavoritesBloc>()..add(GetAllFavoritesEvent()),
      child: FavoritePage(),
    ),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, BottomNavState>(
      builder: (context, state) {
        BottomNavCubit cubit = context.read<BottomNavCubit>();
        return Scaffold(
            body: screens[cubit.bottomNavIndex],
            bottomNavigationBar: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              height: 65,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(50),
                  topLeft: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
                child: BottomNavigationBar(
                    selectedItemColor: AppColors.primaryColor,
                    type: BottomNavigationBarType.fixed,
                    currentIndex: cubit.bottomNavIndex,
                    showSelectedLabels: true,
                    showUnselectedLabels: true,
                    onTap: (index) {
                      cubit.changeBottomNave(index);
                    },
                    items: [
                      bottomNavBarItem(
                          icon: ImagesPath.home,
                          activeIcon: ImagesPath.activeHome,
                          label: S.of(context).home),
                      bottomNavBarItem(
                          icon: ImagesPath.shop,
                          activeIcon: ImagesPath.activeShop,
                          label: S.of(context).shop),
                      bottomNavBarItem(
                          icon: ImagesPath.card,
                          activeIcon: ImagesPath.activeCard,
                          label: S.of(context).card),
                      bottomNavBarItem(
                          icon: ImagesPath.favorite,
                          activeIcon: ImagesPath.activeFavorite,
                          label: S.of(context).favorites),
                      bottomNavBarItem(
                          icon: ImagesPath.profile,
                          activeIcon: ImagesPath.activeProfile,
                          label: S.of(context).profile),
                    ]),
              ),
            ));
      },
    );
  }
}

BottomNavigationBarItem bottomNavBarItem(
        {required String label,
        required String icon,
        required String activeIcon}) =>
    BottomNavigationBarItem(
      icon: SvgPicture.asset(
        icon,
      ),
      activeIcon: SvgPicture.asset(activeIcon),
      label: label,
    );
