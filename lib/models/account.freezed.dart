// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Account {

 String get id; String get name; String get serverUrl; String? get email; String? get userId; bool get isActive; DateTime? get lastLoginAt;
/// Create a copy of Account
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountCopyWith<Account> get copyWith => _$AccountCopyWithImpl<Account>(this as Account, _$identity);

  /// Serializes this Account to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Account&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.serverUrl, serverUrl) || other.serverUrl == serverUrl)&&(identical(other.email, email) || other.email == email)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.lastLoginAt, lastLoginAt) || other.lastLoginAt == lastLoginAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,serverUrl,email,userId,isActive,lastLoginAt);

@override
String toString() {
  return 'Account(id: $id, name: $name, serverUrl: $serverUrl, email: $email, userId: $userId, isActive: $isActive, lastLoginAt: $lastLoginAt)';
}


}

/// @nodoc
abstract mixin class $AccountCopyWith<$Res>  {
  factory $AccountCopyWith(Account value, $Res Function(Account) _then) = _$AccountCopyWithImpl;
@useResult
$Res call({
 String id, String name, String serverUrl, String? email, String? userId, bool isActive, DateTime? lastLoginAt
});




}
/// @nodoc
class _$AccountCopyWithImpl<$Res>
    implements $AccountCopyWith<$Res> {
  _$AccountCopyWithImpl(this._self, this._then);

  final Account _self;
  final $Res Function(Account) _then;

/// Create a copy of Account
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? serverUrl = null,Object? email = freezed,Object? userId = freezed,Object? isActive = null,Object? lastLoginAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,serverUrl: null == serverUrl ? _self.serverUrl : serverUrl // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,lastLoginAt: freezed == lastLoginAt ? _self.lastLoginAt : lastLoginAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Account].
extension AccountPatterns on Account {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Account value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Account() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Account value)  $default,){
final _that = this;
switch (_that) {
case _Account():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Account value)?  $default,){
final _that = this;
switch (_that) {
case _Account() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String serverUrl,  String? email,  String? userId,  bool isActive,  DateTime? lastLoginAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Account() when $default != null:
return $default(_that.id,_that.name,_that.serverUrl,_that.email,_that.userId,_that.isActive,_that.lastLoginAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String serverUrl,  String? email,  String? userId,  bool isActive,  DateTime? lastLoginAt)  $default,) {final _that = this;
switch (_that) {
case _Account():
return $default(_that.id,_that.name,_that.serverUrl,_that.email,_that.userId,_that.isActive,_that.lastLoginAt);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String serverUrl,  String? email,  String? userId,  bool isActive,  DateTime? lastLoginAt)?  $default,) {final _that = this;
switch (_that) {
case _Account() when $default != null:
return $default(_that.id,_that.name,_that.serverUrl,_that.email,_that.userId,_that.isActive,_that.lastLoginAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Account implements Account {
  const _Account({required this.id, required this.name, required this.serverUrl, this.email, this.userId, this.isActive = false, this.lastLoginAt});
  factory _Account.fromJson(Map<String, dynamic> json) => _$AccountFromJson(json);

@override final  String id;
@override final  String name;
@override final  String serverUrl;
@override final  String? email;
@override final  String? userId;
@override@JsonKey() final  bool isActive;
@override final  DateTime? lastLoginAt;

/// Create a copy of Account
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountCopyWith<_Account> get copyWith => __$AccountCopyWithImpl<_Account>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccountToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Account&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.serverUrl, serverUrl) || other.serverUrl == serverUrl)&&(identical(other.email, email) || other.email == email)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.lastLoginAt, lastLoginAt) || other.lastLoginAt == lastLoginAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,serverUrl,email,userId,isActive,lastLoginAt);

@override
String toString() {
  return 'Account(id: $id, name: $name, serverUrl: $serverUrl, email: $email, userId: $userId, isActive: $isActive, lastLoginAt: $lastLoginAt)';
}


}

/// @nodoc
abstract mixin class _$AccountCopyWith<$Res> implements $AccountCopyWith<$Res> {
  factory _$AccountCopyWith(_Account value, $Res Function(_Account) _then) = __$AccountCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String serverUrl, String? email, String? userId, bool isActive, DateTime? lastLoginAt
});




}
/// @nodoc
class __$AccountCopyWithImpl<$Res>
    implements _$AccountCopyWith<$Res> {
  __$AccountCopyWithImpl(this._self, this._then);

  final _Account _self;
  final $Res Function(_Account) _then;

/// Create a copy of Account
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? serverUrl = null,Object? email = freezed,Object? userId = freezed,Object? isActive = null,Object? lastLoginAt = freezed,}) {
  return _then(_Account(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,serverUrl: null == serverUrl ? _self.serverUrl : serverUrl // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,lastLoginAt: freezed == lastLoginAt ? _self.lastLoginAt : lastLoginAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc
mixin _$AccountState {

 List<Account> get accounts; Account? get currentAccount; bool get isLoading; String? get errorMessage;
/// Create a copy of AccountState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountStateCopyWith<AccountState> get copyWith => _$AccountStateCopyWithImpl<AccountState>(this as AccountState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountState&&const DeepCollectionEquality().equals(other.accounts, accounts)&&(identical(other.currentAccount, currentAccount) || other.currentAccount == currentAccount)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(accounts),currentAccount,isLoading,errorMessage);

@override
String toString() {
  return 'AccountState(accounts: $accounts, currentAccount: $currentAccount, isLoading: $isLoading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $AccountStateCopyWith<$Res>  {
  factory $AccountStateCopyWith(AccountState value, $Res Function(AccountState) _then) = _$AccountStateCopyWithImpl;
@useResult
$Res call({
 List<Account> accounts, Account? currentAccount, bool isLoading, String? errorMessage
});


$AccountCopyWith<$Res>? get currentAccount;

}
/// @nodoc
class _$AccountStateCopyWithImpl<$Res>
    implements $AccountStateCopyWith<$Res> {
  _$AccountStateCopyWithImpl(this._self, this._then);

  final AccountState _self;
  final $Res Function(AccountState) _then;

/// Create a copy of AccountState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accounts = null,Object? currentAccount = freezed,Object? isLoading = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
accounts: null == accounts ? _self.accounts : accounts // ignore: cast_nullable_to_non_nullable
as List<Account>,currentAccount: freezed == currentAccount ? _self.currentAccount : currentAccount // ignore: cast_nullable_to_non_nullable
as Account?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of AccountState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccountCopyWith<$Res>? get currentAccount {
    if (_self.currentAccount == null) {
    return null;
  }

  return $AccountCopyWith<$Res>(_self.currentAccount!, (value) {
    return _then(_self.copyWith(currentAccount: value));
  });
}
}


/// Adds pattern-matching-related methods to [AccountState].
extension AccountStatePatterns on AccountState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AccountState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AccountState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AccountState value)  $default,){
final _that = this;
switch (_that) {
case _AccountState():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AccountState value)?  $default,){
final _that = this;
switch (_that) {
case _AccountState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Account> accounts,  Account? currentAccount,  bool isLoading,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AccountState() when $default != null:
return $default(_that.accounts,_that.currentAccount,_that.isLoading,_that.errorMessage);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Account> accounts,  Account? currentAccount,  bool isLoading,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _AccountState():
return $default(_that.accounts,_that.currentAccount,_that.isLoading,_that.errorMessage);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Account> accounts,  Account? currentAccount,  bool isLoading,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _AccountState() when $default != null:
return $default(_that.accounts,_that.currentAccount,_that.isLoading,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _AccountState extends AccountState {
  const _AccountState({final  List<Account> accounts = const [], this.currentAccount, this.isLoading = false, this.errorMessage}): _accounts = accounts,super._();
  

 final  List<Account> _accounts;
@override@JsonKey() List<Account> get accounts {
  if (_accounts is EqualUnmodifiableListView) return _accounts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_accounts);
}

@override final  Account? currentAccount;
@override@JsonKey() final  bool isLoading;
@override final  String? errorMessage;

/// Create a copy of AccountState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountStateCopyWith<_AccountState> get copyWith => __$AccountStateCopyWithImpl<_AccountState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountState&&const DeepCollectionEquality().equals(other._accounts, _accounts)&&(identical(other.currentAccount, currentAccount) || other.currentAccount == currentAccount)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_accounts),currentAccount,isLoading,errorMessage);

@override
String toString() {
  return 'AccountState(accounts: $accounts, currentAccount: $currentAccount, isLoading: $isLoading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$AccountStateCopyWith<$Res> implements $AccountStateCopyWith<$Res> {
  factory _$AccountStateCopyWith(_AccountState value, $Res Function(_AccountState) _then) = __$AccountStateCopyWithImpl;
@override @useResult
$Res call({
 List<Account> accounts, Account? currentAccount, bool isLoading, String? errorMessage
});


@override $AccountCopyWith<$Res>? get currentAccount;

}
/// @nodoc
class __$AccountStateCopyWithImpl<$Res>
    implements _$AccountStateCopyWith<$Res> {
  __$AccountStateCopyWithImpl(this._self, this._then);

  final _AccountState _self;
  final $Res Function(_AccountState) _then;

/// Create a copy of AccountState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accounts = null,Object? currentAccount = freezed,Object? isLoading = null,Object? errorMessage = freezed,}) {
  return _then(_AccountState(
accounts: null == accounts ? _self._accounts : accounts // ignore: cast_nullable_to_non_nullable
as List<Account>,currentAccount: freezed == currentAccount ? _self.currentAccount : currentAccount // ignore: cast_nullable_to_non_nullable
as Account?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of AccountState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccountCopyWith<$Res>? get currentAccount {
    if (_self.currentAccount == null) {
    return null;
  }

  return $AccountCopyWith<$Res>(_self.currentAccount!, (value) {
    return _then(_self.copyWith(currentAccount: value));
  });
}
}

// dart format on
