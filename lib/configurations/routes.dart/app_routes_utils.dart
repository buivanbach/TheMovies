enum PAGES {
  
  homepage,
  detailmovie
}

extension AppPageExtension on PAGES {

  String get screenPath {
    switch (this) {
      case PAGES.homepage:
        return "/";
      case PAGES.detailmovie:
        return "/login";
      
      default:
        return "/";
    }
  }

  String get screenName {
    switch (this) {
      case PAGES.homepage:
        return "HOME";
      case PAGES.detailmovie:
        return "Hello";
  
      default:
        return "HOME";
    }
  }


}