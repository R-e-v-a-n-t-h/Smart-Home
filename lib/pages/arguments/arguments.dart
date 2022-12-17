class LoadingToHomes{
  final Map homes;
  LoadingToHomes(this.homes);
}

class HomeToRooms {
  final Map rooms;
  HomeToRooms(this.rooms);
}


class RoomToItems{
  final Map items;
  RoomToItems(this.items);
}


class ItemToProductLoading{
  final String Id;
  ItemToProductLoading(this.Id);
}

class ProductLoadingToProduct{
  Map details;
  DateTime OnTime;
  DateTime OffTime;
  int secondsDifference;
  ProductLoadingToProduct(this.details,this.OnTime,this.OffTime,this.secondsDifference);
}