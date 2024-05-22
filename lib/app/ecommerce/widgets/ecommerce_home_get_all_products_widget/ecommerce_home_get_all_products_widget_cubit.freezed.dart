// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ecommerce_home_get_all_products_widget_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EcommerceHomeGetAllProductsWidgetState {
  List<ProductsDatabase> get likedProducts =>
      throw _privateConstructorUsedError;
  BooleanStatus get likedStatus => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<ProductsDatabase> likedProducts, BooleanStatus likedStatus)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<ProductsDatabase> likedProducts, BooleanStatus likedStatus)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<ProductsDatabase> likedProducts, BooleanStatus likedStatus)?
        initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EcommerceHomeGetAllProductsWidgetStateCopyWith<
          EcommerceHomeGetAllProductsWidgetState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EcommerceHomeGetAllProductsWidgetStateCopyWith<$Res> {
  factory $EcommerceHomeGetAllProductsWidgetStateCopyWith(
          EcommerceHomeGetAllProductsWidgetState value,
          $Res Function(EcommerceHomeGetAllProductsWidgetState) then) =
      _$EcommerceHomeGetAllProductsWidgetStateCopyWithImpl<$Res,
          EcommerceHomeGetAllProductsWidgetState>;
  @useResult
  $Res call({List<ProductsDatabase> likedProducts, BooleanStatus likedStatus});
}

/// @nodoc
class _$EcommerceHomeGetAllProductsWidgetStateCopyWithImpl<$Res,
        $Val extends EcommerceHomeGetAllProductsWidgetState>
    implements $EcommerceHomeGetAllProductsWidgetStateCopyWith<$Res> {
  _$EcommerceHomeGetAllProductsWidgetStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? likedProducts = null,
    Object? likedStatus = null,
  }) {
    return _then(_value.copyWith(
      likedProducts: null == likedProducts
          ? _value.likedProducts
          : likedProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductsDatabase>,
      likedStatus: null == likedStatus
          ? _value.likedStatus
          : likedStatus // ignore: cast_nullable_to_non_nullable
              as BooleanStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $EcommerceHomeGetAllProductsWidgetStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ProductsDatabase> likedProducts, BooleanStatus likedStatus});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$EcommerceHomeGetAllProductsWidgetStateCopyWithImpl<$Res,
        _$InitialImpl> implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? likedProducts = null,
    Object? likedStatus = null,
  }) {
    return _then(_$InitialImpl(
      likedProducts: null == likedProducts
          ? _value._likedProducts
          : likedProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductsDatabase>,
      likedStatus: null == likedStatus
          ? _value.likedStatus
          : likedStatus // ignore: cast_nullable_to_non_nullable
              as BooleanStatus,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {required final List<ProductsDatabase> likedProducts,
      this.likedStatus = BooleanStatus.initial})
      : _likedProducts = likedProducts;

  final List<ProductsDatabase> _likedProducts;
  @override
  List<ProductsDatabase> get likedProducts {
    if (_likedProducts is EqualUnmodifiableListView) return _likedProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_likedProducts);
  }

  @override
  @JsonKey()
  final BooleanStatus likedStatus;

  @override
  String toString() {
    return 'EcommerceHomeGetAllProductsWidgetState.initial(likedProducts: $likedProducts, likedStatus: $likedStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            const DeepCollectionEquality()
                .equals(other._likedProducts, _likedProducts) &&
            (identical(other.likedStatus, likedStatus) ||
                other.likedStatus == likedStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_likedProducts), likedStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<ProductsDatabase> likedProducts, BooleanStatus likedStatus)
        initial,
  }) {
    return initial(likedProducts, likedStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<ProductsDatabase> likedProducts, BooleanStatus likedStatus)?
        initial,
  }) {
    return initial?.call(likedProducts, likedStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<ProductsDatabase> likedProducts, BooleanStatus likedStatus)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(likedProducts, likedStatus);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements EcommerceHomeGetAllProductsWidgetState {
  const factory _Initial(
      {required final List<ProductsDatabase> likedProducts,
      final BooleanStatus likedStatus}) = _$InitialImpl;

  @override
  List<ProductsDatabase> get likedProducts;
  @override
  BooleanStatus get likedStatus;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
