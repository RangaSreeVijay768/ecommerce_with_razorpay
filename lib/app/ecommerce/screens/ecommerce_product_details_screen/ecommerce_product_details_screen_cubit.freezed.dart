// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ecommerce_product_details_screen_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EcommerceProductDetailsScreenState {
  int get productCount => throw _privateConstructorUsedError;
  List<ProductsDatabase> get cartItems => throw _privateConstructorUsedError;
  List<ProductsDatabase> get likedProducts =>
      throw _privateConstructorUsedError;
  int? get selectedSize => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int productCount,
            List<ProductsDatabase> cartItems,
            List<ProductsDatabase> likedProducts,
            int? selectedSize)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int productCount, List<ProductsDatabase> cartItems,
            List<ProductsDatabase> likedProducts, int? selectedSize)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int productCount, List<ProductsDatabase> cartItems,
            List<ProductsDatabase> likedProducts, int? selectedSize)?
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
  $EcommerceProductDetailsScreenStateCopyWith<
          EcommerceProductDetailsScreenState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EcommerceProductDetailsScreenStateCopyWith<$Res> {
  factory $EcommerceProductDetailsScreenStateCopyWith(
          EcommerceProductDetailsScreenState value,
          $Res Function(EcommerceProductDetailsScreenState) then) =
      _$EcommerceProductDetailsScreenStateCopyWithImpl<$Res,
          EcommerceProductDetailsScreenState>;
  @useResult
  $Res call(
      {int productCount,
      List<ProductsDatabase> cartItems,
      List<ProductsDatabase> likedProducts,
      int? selectedSize});
}

/// @nodoc
class _$EcommerceProductDetailsScreenStateCopyWithImpl<$Res,
        $Val extends EcommerceProductDetailsScreenState>
    implements $EcommerceProductDetailsScreenStateCopyWith<$Res> {
  _$EcommerceProductDetailsScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productCount = null,
    Object? cartItems = null,
    Object? likedProducts = null,
    Object? selectedSize = freezed,
  }) {
    return _then(_value.copyWith(
      productCount: null == productCount
          ? _value.productCount
          : productCount // ignore: cast_nullable_to_non_nullable
              as int,
      cartItems: null == cartItems
          ? _value.cartItems
          : cartItems // ignore: cast_nullable_to_non_nullable
              as List<ProductsDatabase>,
      likedProducts: null == likedProducts
          ? _value.likedProducts
          : likedProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductsDatabase>,
      selectedSize: freezed == selectedSize
          ? _value.selectedSize
          : selectedSize // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $EcommerceProductDetailsScreenStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int productCount,
      List<ProductsDatabase> cartItems,
      List<ProductsDatabase> likedProducts,
      int? selectedSize});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$EcommerceProductDetailsScreenStateCopyWithImpl<$Res,
        _$InitialImpl> implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productCount = null,
    Object? cartItems = null,
    Object? likedProducts = null,
    Object? selectedSize = freezed,
  }) {
    return _then(_$InitialImpl(
      productCount: null == productCount
          ? _value.productCount
          : productCount // ignore: cast_nullable_to_non_nullable
              as int,
      cartItems: null == cartItems
          ? _value._cartItems
          : cartItems // ignore: cast_nullable_to_non_nullable
              as List<ProductsDatabase>,
      likedProducts: null == likedProducts
          ? _value._likedProducts
          : likedProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductsDatabase>,
      selectedSize: freezed == selectedSize
          ? _value.selectedSize
          : selectedSize // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {this.productCount = 1,
      required final List<ProductsDatabase> cartItems,
      required final List<ProductsDatabase> likedProducts,
      this.selectedSize})
      : _cartItems = cartItems,
        _likedProducts = likedProducts;

  @override
  @JsonKey()
  final int productCount;
  final List<ProductsDatabase> _cartItems;
  @override
  List<ProductsDatabase> get cartItems {
    if (_cartItems is EqualUnmodifiableListView) return _cartItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cartItems);
  }

  final List<ProductsDatabase> _likedProducts;
  @override
  List<ProductsDatabase> get likedProducts {
    if (_likedProducts is EqualUnmodifiableListView) return _likedProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_likedProducts);
  }

  @override
  final int? selectedSize;

  @override
  String toString() {
    return 'EcommerceProductDetailsScreenState.initial(productCount: $productCount, cartItems: $cartItems, likedProducts: $likedProducts, selectedSize: $selectedSize)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.productCount, productCount) ||
                other.productCount == productCount) &&
            const DeepCollectionEquality()
                .equals(other._cartItems, _cartItems) &&
            const DeepCollectionEquality()
                .equals(other._likedProducts, _likedProducts) &&
            (identical(other.selectedSize, selectedSize) ||
                other.selectedSize == selectedSize));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      productCount,
      const DeepCollectionEquality().hash(_cartItems),
      const DeepCollectionEquality().hash(_likedProducts),
      selectedSize);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int productCount,
            List<ProductsDatabase> cartItems,
            List<ProductsDatabase> likedProducts,
            int? selectedSize)
        initial,
  }) {
    return initial(productCount, cartItems, likedProducts, selectedSize);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int productCount, List<ProductsDatabase> cartItems,
            List<ProductsDatabase> likedProducts, int? selectedSize)?
        initial,
  }) {
    return initial?.call(productCount, cartItems, likedProducts, selectedSize);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int productCount, List<ProductsDatabase> cartItems,
            List<ProductsDatabase> likedProducts, int? selectedSize)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(productCount, cartItems, likedProducts, selectedSize);
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

abstract class _Initial implements EcommerceProductDetailsScreenState {
  const factory _Initial(
      {final int productCount,
      required final List<ProductsDatabase> cartItems,
      required final List<ProductsDatabase> likedProducts,
      final int? selectedSize}) = _$InitialImpl;

  @override
  int get productCount;
  @override
  List<ProductsDatabase> get cartItems;
  @override
  List<ProductsDatabase> get likedProducts;
  @override
  int? get selectedSize;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
