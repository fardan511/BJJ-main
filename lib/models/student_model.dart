class StudentModel {
  String? id;
  String? username;
  String? profileTitle;
  String? profileName;
  String? userImage;
  String? userEmail;
  String? gender;
  String? hourlyRate;
  String? level;
  String? livingTown;
  String? location;
  String? noOfYears;
  String? role;
  String? status;
  String? facebookURL;
  String? instagramURL;
  String? twitterURL;
  String? linkedinURL;
  String? otherLinkURL;
  String? userName;
  String? bioDescription;

  StudentModel({
    this.id,
    this.username,
    this.profileTitle,
    this.profileName,
    this.userImage,
    this.userEmail,
    this.gender,
    this.hourlyRate,
    this.level,
    this.livingTown,
    this.location,
    this.noOfYears,
    this.role,
    this.status,
    this.facebookURL,
    this.instagramURL,
    this.twitterURL,
    this.linkedinURL,
    this.otherLinkURL,
    this.userName,
    this.bioDescription,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      id: json.containsKey('id') ? json['id'] : null,
      username: json.containsKey('username') ? json['username'] : null,
      profileTitle: json.containsKey('profileTitle') ? json['profileTitle'] : null,
      profileName: json.containsKey('profileName') ? json['profileName'] : null,
      userImage: json.containsKey('userImage') ? json['userImage'] : null,
      userEmail: json.containsKey('userEmail') ? json['userEmail'] : null,
      gender: json.containsKey('gender') ? json['gender'] : null,
      hourlyRate: json.containsKey('hourlyRate') ? json['hourlyRate'] : null,
      level: json.containsKey('level') ? json['level'] : null,
      livingTown: json.containsKey('livingTown') ? json['livingTown'] : null,
      location: json.containsKey('location') ? json['location'] : null,
      noOfYears: json.containsKey('noOfYears') ? json['noOfYears'] : null,
      role: json.containsKey('role') ? json['role'] : null,
      status: json.containsKey('status') ? json['status'] : null,
      facebookURL: json.containsKey('facebookURL') ? json['facebookURL'] : null,
      instagramURL: json.containsKey('instagramURL') ? json['instagramURL'] : null,
      twitterURL: json.containsKey('twitterURL') ? json['twitterURL'] : null,
      linkedinURL: json.containsKey('linkedinURL') ? json['linkedinURL'] : null,
      otherLinkURL: json.containsKey('otherLinkURL') ? json['otherLinkURL'] : null,
      userName: json.containsKey('userName') ? json['userName'] : null,
      bioDescription: json.containsKey('bioDescription') ? json['bioDescription'] : null,
    );
  }
}
