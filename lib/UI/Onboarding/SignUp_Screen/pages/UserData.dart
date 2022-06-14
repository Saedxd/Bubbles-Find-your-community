class UsersData {
  String Email="";
  String Pass="";
  String ConfirmPass="";
  String FirstName="";
  String LastName="";
  String BirthDay="";
  int GenderID=0;
  int AvatarID=0;
  List<int>? Interset=[];
  String Color2="";

  UsersData({
      this.Email="",
      this.Color2="",
      this.Pass="",
      this.Interset,
      this.LastName="",
      this.FirstName="",
      this.BirthDay="",
      this.GenderID=0,
      this.ConfirmPass="",
      this.AvatarID=0
      });

  void SetFirstnameANDLastname(String firstname,String Lastname){
    this.FirstName = firstname;
    this.LastName = Lastname;
  }

  void SetBirthDate(String BIrthDaY){
    this.BirthDay = BIrthDaY;
  }

  void SetGender(int GenderId){
    this.GenderID = GenderId;
  }

  void SetInterests(List<int> Interests){
    this.Interset = Interests;
  }

  void SetAvatar(int AvatarID){
    this.AvatarID = AvatarID;
  }

  void SetBackGroundColor(String BackGroundColor){
    this.Color2 = BackGroundColor;
  }

//////////////////////////////////////////
  String GetFirstname(){
    return FirstName;
  }

  String GetBirthDate(){
    return BirthDay;
  }

  int GetGender(){
    return GenderID;
  }

  List<int> GetInterests(){
    return Interset!;
  }

  int GetAvatar(){
    return AvatarID;
  }

  String GetBackGroundColor(){
    return Color2;
  }

  String GetLastname(){
    return LastName;
  }

  String GetPass(){
    return Pass;
  }

  String GetEmail(){
    return Email;
  }

}
