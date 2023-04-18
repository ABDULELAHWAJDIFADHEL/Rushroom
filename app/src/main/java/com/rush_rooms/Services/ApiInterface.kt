
import io.reactivex.Observable
import retrofit2.http.*

interface ApiInterface {

   /* @POST(LOGIN)
    fun userLogin(@Body params: Any): Observable<LoginResponse?>

    @GET(VIEWPROFILE)
    fun onViewProfile(@Header("Authorization") token: String): Observable<ViewProfileRes?>
    @GET(CATEGORYLIST)
    fun onCategoryList(@Header("Authorization") token: String): Observable<CategoryListRes?>
    @GET(PACKAGELIST)
    fun onPackageList(
        @Header("Authorization") token: String,
    ): Observable<PackageListRes?>

    @GET(PACKAGELIST)
    fun onPackageSubCategoryList(
        @Header("Authorization") token: String,
        @Query("subCategoryId") subCategoryId: String? = null,
        @Query("categoryId") categoryId: String? = null,

        ): Observable<PackageListRes?>

    @GET(PACKAGELIST)
    fun onNewPackageSubCategoryList(
        @Header("Authorization") token: String,
        @Query("subCategoryId") subCategoryId: String? = null,
    ): Observable<PackageListRes?>

    @GET(VACCINELIST)
    fun onVaccineList(@Header("Authorization") token: String): Observable<VaccineListRes?>

    @POST(WISHPACKAGELIST)
    fun onWishPacakgeList(
        @Header("Authorization") token: String,
        @Body params: Any
    ): Observable<WishPackageListRes?>

    @POST(WISHVACCINELIST)
    fun onWishVaccineList(
        @Header("Authorization") token: String,
        @Body params: Any
    ): Observable<WishVaccineListRes?>

    @GET(BANNERLIST)
    fun onBannerList(
        @Header("Authorization") token: String,
    ): Observable<BannerListRes?>

    @GET(SUBCATEGORYLIST)
    fun onSubcategoryList(
        @Header("Authorization") token: String,
        @Query("categoryId") categoryId: String
    ): Observable<SubcategoryListRes?>

    @POST(UPDATEPROFILE)
    fun onUpdateProfile(
        @Header("Authorization") token: String,
        @Body params: Any
    ): Observable<UpdateProfileRes?>

    @POST(STATELIST)
    fun onStateList(
        @Header("Authorization") token: String,
    ): Observable<StateListRes?>

    @POST(CITYLIST)
    fun onCityList(
        @Header("Authorization") token: String,
        @Body params: Any
    ): Observable<CityListRes?>

    @POST(ADDADDRESS)
    fun onAddAddress(
        @Header("Authorization") token: String,
        @Body params: Any
    ): Observable<AddSecondAddressRes?>

    @GET(ADDRESSLIST)
    fun onAddressList(
        @Header("Authorization") token: String,
    ): Observable<AddressListRes?>

    @GET(DELETE)
    fun onDelete(
        @Header("Authorization") token: String,
        @Query("addressId") addressId: String
    ): Observable<DeleteRes?>

    @POST(UPDATEADDRESS)
    fun onUpdateAddress(
        @Header("Authorization") token: String,
        @Body params: Any
    ): Observable<UpdateAddressRes?>

    @POST(DEFAULTADDRESS)
    fun onDefaultAddress(
        @Header("Authorization") token: String,
        @Body params: Any
    ): Observable<DefaultAdressRes?>

    @POST(ADDFAMILYMEMBER)
    fun onAddFamilyMember(
        @Header("Authorization") token: String,
        @Body params: Any
    ): Observable<AddFamilyMemberRes?>

    @GET(FAMILYMEMBERLIST)
    fun onFamilyMemberList(
        @Header("Authorization") token: String,
    ): Observable<AddFamilyMemberListRes?>

    @GET(DELETEFAMILYMEMBER)
    fun onDeleteFamilyMember(
        @Header("Authorization") token: String,
        @Query("memberId") memberId: String
    ): Observable<DeleteMemberRes?>

    @POST(UPDATEFAMILYMEMBER)
    fun onUpdateFamilyMember(
        @Header("Authorization") token: String,
        @Body params: Any
    ): Observable<UpdateFamilyMemberRes?>

    @POST(PACKAGEDETAILS)
    fun onPackageDetails(
        @Header("Authorization") token: String,
        @Body params: Any
    ): Observable<PackageDetailsRes?>

    @POST(VACCINEDETAILS)
    fun onVaccineDetails(
        @Header("Authorization") token: String,
        @Body params: Any
    ): Observable<VaccineDetailsRes?>

    @GET(ABOUTS)
    fun onAbout(
        @Query("type") type: String
    ): Observable<AboutsRes?>

    @POST(ADDTOCART)
    fun onAddtoCart(
        @Header("Authorization") token: String,
        @Body params: Any
    ): Observable<AddtoCartRes?>

    @GET(CARTLIST)
    fun onCartList(
        @Header("Authorization") token: String,
    ): Observable<CartListRes?>

    @POST(DELETECART)
    fun onDeleteCart(
        @Header("Authorization") token: String,
        @Body params: Any
    ): Observable<DeleteCartRes?>

    @POST(SIGNUP)
    fun onSignup(
        @Body params: Any
    ): Observable<SignUpRes?>

    @POST(CHECKUSER)
    fun onCheckUser(
        @Body params: Any
    ): Observable<CommonModelRes?>

    @POST(OTPEMAILS)
    fun onOtpEmail(
        @Body params: Any
    ): Observable<OtpEmailRes?>

    @POST(OTPVERIFY)
    fun onOtpVerify(
        @Body params: Any
    ): Observable<CommonModelRes?>

    @POST(SETPASSWORD)
    fun onSetPassword(
        @Body params: Any
    ): Observable<CommonModelRes?>

    @POST(SLOTLIST)
    fun onSlotList(
        @Header("Authorization") token: String,
        @Body params: Any
    ): Observable<SlotListRes?>

    @POST(CALLSCHEDULELIST)
    fun onCallScheduleList(
        @Header("Authorization") token: String,
    ): Observable<CallScheduleListRes?>

    @POST(RELATEDPACKAGELIST)
    fun onRelatedPackageList(
        @Header("Authorization") token: String,
        @Body params: Any
    ): Observable<RelatedPackageListRes?>

    @POST(FORGOTPASSWORD)
    fun onForgotPassword(
        @Body params: Any
    ): Observable<CommonModelRes?>

    @POST(CHECKOUT)
    fun onCheckOut(
        @Header("Authorization") token: String,
        @Body params: Any
    ): Observable<CheckOutCartRes?>

    @POST(BOOKSCHEDULE)
    fun onBookSchedule(
        @Header("Authorization") token: String,
        @Body params: Any
    ): Observable<BookScheduleRes?>

    @POST(ORDER)
    @FormUrlEncoded
    fun onOrderList(
        @Header("Authorization") token: String,
        @Field("orderType") orderType: String
    ): Observable<CurrentOrderListRes?>

    @POST(ORDER)
    @FormUrlEncoded
    fun onOrderCompletedList(
        @Header("Authorization") token: String,
        @Field("orderType") orderType: String
    ): Observable<CompleteOrderListRes?>

    @POST(ORDER)
    @FormUrlEncoded
    fun onOrderCancelList(
        @Header("Authorization") token: String,
        @Field("orderType") orderType: String
    ): Observable<CancelOrederListRes?>

    @GET(TESTIMONIAL)
    fun onTestimonialList(
        @Header("Authorization") token: String
    ): Observable<TestimonialListRes?>

    @GET(GLOBALSEARCH)
    fun onGlobalSearch(
        @Header("Authorization") token: String
    ): Observable<GlobalSearchRes?>

    @POST(ORDERDETAILS)
    fun onOrderDetails(
        @Header("Authorization") token: String,
        @Body params: Any
    ): Observable<OrderDetailsRes?>

    @POST(ADDFAV)
    fun onAddFav(
        @Header("Authorization") token: String,
        @Body params: Any
    ): Observable<AddFavRes?>

    @POST(CANCELORDER)
    fun onCancelOrder(
        @Header("Authorization") token: String,
        @Body params: Any
    ): Observable<CancelOrderRes?>

    @POST(CHANGEPASSWORD)
    fun onChangePassword(
        @Header("Authorization") token: String,
        @Body params: Any
    ): Observable<CommonModelRes?>

    @GET(SETNOTIFICATION)
    fun onSetNotification(
        @Header("Authorization") token: String,
    ): Observable<SetNotificationRes?>

    @POST(MEMBER_RECORD)
    fun onMemberRecord(
        @Header("Authorization") token: String,
        @Body params: Any
    ): Observable<MemberRecordRes?>

    @POST(KIDSGROWTHS)
    fun onKidsGrowthsRecord(
        @Header("Authorization") token: String,
        @Body params: Any
    ): Observable<KidsGrowthsRes?>

    @GET(CUSTOMEPACKAGELIST)
    fun onCustomePackageList(
        @Header("Authorization") token: String,
    ): Observable<CustomPackageListRes?>

    @GET(OFFERSLIST)
    fun onOffersList(
        @Header("Authorization") token: String,
    ): Observable<OffersListRes?>

    @POST(CREATEOWNPACKAGELIST)
    fun onCreateOwnPackageList(
        @Header("Authorization") token: String,
        @Body params: Any
    ): Observable<CreateOwnPackageListRes?>

    @POST(ADDCREATEOWNPACKAGE)
    fun onAddCreateOwnPackage(
        @Header("Authorization") token: String,
        @Body params: Any
    ): Observable<AddCreateOwnPackageRes?>

    @POST(SUBCENTER)
    fun onSubCenter(
        @Header("Authorization") token: String,
        @Body params: Any
    ): Observable<SubCenterRes?>

    @GET(NOTIFICATIONLIST)
    fun onNotificationList(
        @Header("Authorization") token: String,
    ): Observable<NotificationListRes?>

    @POST(DOSEFORAGE)
    fun onDoseForAge(
        @Header("Authorization") token: String,
        @Body params: Any
    ): Observable<DoseForAgeListRes?>

//
//    @GET(ABOUTS)
//    fun onTerm(
//        @Header("Authorization") token: String,
//        @Query("type") type: String
//    ): Observable<TermsRes?>
//
//    @GET(ABOUTS)
//    fun onPrivacy(
//        @Header("Authorization") token: String,
//        @Query("type") type: String
//    ): Observable<TermsRes?>
//    @GET(LOGOUT)
//    fun onLogOut(@Header("Authorization") token: String): Observable<CommonModal?>
//
//    @GET(PROFILEDETAILS)
//    fun getProfileDetails(@Header("Authorization") token: String): Observable<LoginReponse?>
//
//    @POST(SOCIALLOGIN)
//    fun onSocialLogin(@Body params: Any): Observable<LoginReponse?>
//
//    @POST(EMAILVALIDATE)
//    fun onEmailValide(@Body params: Any): Observable<CommanModal?>
//
//    @POST(EMAILVERIFIED)
//    fun onEmailVerified(@Body params: Any): Observable<CommanModal?>
//
//    @POST(MOBILEVALIDATE)
//    fun onMobileValidate(@Body params: Any): Observable<CommanModal?>
//
//    @POST(PROFILECOMPLETE)
//    fun onProfileComplete(
//        @Body params: Any,
//        @Header("Authorization") token: String
//    ): Observable<CommanModal?>
//
//    @POST(SOCIALREGISTER)
//    fun onSocialRegister(
//        @Body params: Any,
//    ): Observable<LoginReponse?>
//
//    @POST(REGISTER)
//    fun onRegister(@Body params: Any): Observable<TokenModal?>
//

//
//    @POST(UPDATEPROFILE)
//    fun onUpdateProfile(
//        @Body params: Any,
//        @Header("Authorization") token: String
//    ): Observable<LoginReponse?>
//
//    @POST(UPDATEPASSWORD)
//    fun updateChange(
//        @Body params: Any,
//        @Header("Authorization") token: String
//    ): Observable<CommanModal?>
//
//    @GET(NOTIFICATIONSTATUS)
//    fun onNotificationStatusChange(@Header("Authorization") token: String): Observable<LoginReponse?>
//
//    @POST(GETPOPULARCATALYST)
//    fun getPopularCatalyst(
//        @Body params: Any,
//        @Header("Authorization") token: String
//    ): Observable<ResponsePopularCatalyst?>
//
//
//    @GET(GETCATALYSTDETAILS + "/{categoryId}")
//    fun getCatalystDetails(
//        @Header("Authorization") token: String,
//        @Path("categoryId") id: String
//    ): Observable<ResponseCatelystDetails?>
//
//
//    @POST(ADDTOCART)
//    fun onAddToCart(
//        @Body params: Any,
//        @Header("Authorization") token: String
//    ): Observable<CommanModal?>
//
//    @Headers("Content-Type: application/json")
//    @GET(CARTLIST)
//    fun getCartList(@Header("Authorization") token: String): Observable<MyCartListResponse?>
//
//    @POST(REMOVECARTITEM)
//    fun removeCartItem(
//        @Body params: Any,
//        @Header("Authorization") token: String
//    ): Observable<CommanModal?>
//
//    @POST(ONSAVEBASKET)
//    fun onSaveBasket(
//        @Body params: Any,
//        @Header("Authorization") token: String
//    ): Observable<CommanModal?>
//
//    @GET(CREATEBASKET)
//    fun createBasket(@Header("Authorization") token: String): Observable<CommanModal?>
//
//    @GET(BASKETLIST)
//    fun getBasketList(@Header("Authorization") token: String): Observable<OnBasketListResponse?>
//
//    @GET(BASKETREMOVE + "/{id}")
//    fun onRemoveBasket(
//        @Header("Authorization") token: String,
//        @Path("id") id: String
//    ): Observable<CommanModal?>
//
//    @GET(BASKETVIEW + "/{id}")
//    fun onViewBasket(
//        @Header("Authorization") token: String,
//        @Path("id") id: String
//    ): Observable<MyCartListResponse?>
//
//    @POST(BASKETEDIT)
//    fun onEditBasket(
//        @Body params: Any,
//        @Header("Authorization") token: String
//    ): Observable<CommanModal?>
//
//    @POST(FORGOTPASSWORD)
//    fun onforgetPassword(
//        @Body params: Any,
//        ): Observable<CommanModal?>
//
//    @GET(METALPRICE)
//    fun getMetalPrice(@Header("Authorization") token: String): Observable<StokePriceResponse?>
//
//    @GET(CREDITDETAILS)
//    fun getCreditsDetails(@Header("Authorization") token: String): Observable<CreditRes?>
//
//    @GET(NEWCREDITDETAILS + "/{id}")
//    fun getCreditsPurchase(
//        @Header("Authorization") token: String,
//        @Path("id") id: String
//    ): Observable<Credit_DetailRes?>
//
//    @GET(DOWNLOADPDF + "/{id}")
//    fun getDownloadPdf(
//        @Header("Authorization") token: String,
//        @Path("id") id: String
//    ): Observable<DownloadPdfRes?>
//
//    @GET(EMAIL + "/{id}")
//    fun getEmail(
//        @Header("Authorization") token: String,
//        @Path("id") id: String
//    ): Observable<CommanModal?>
//
//    @POST(CATALYSTPRICE)
//    fun getCatalystPrices(
//        @Body params: Any,
//        @Header("Authorization") token: String
//    ): Observable<CatalystPriceRes>
//
//    @POST(CREDITSAVE)
//    fun onCreditSave(
//        @Body params: Any,
//        @Header("Authorization") token: String
//    ): Observable<CommanModal>
//
//    @POST(SEARCHNUMBER)
//    fun onSearchNumber(
//        @Body params: Any,
//        @Header("Authorization") token: String
//    ): Observable<SearchNumberResponse>
//
//
//    @GET(NOTIFICATIONLIST)
//    fun getNotificationList(
//        @Header("Authorization") token: String
//    ): Observable<NotificationListRes>*/
}