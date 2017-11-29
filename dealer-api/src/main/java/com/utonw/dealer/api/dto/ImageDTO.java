package com.utonw.dealer.api.dto;

import java.io.Serializable;
import java.util.List;

/**
 * Created by SEELE on 2017/4/21.
 */
public class ImageDTO implements Serializable{
    private static final long serialVersionUID = 483254120030155246L;
    private List<String> idCardUrls;//夫妻双方身份证
    private List<String> widdingOrDiv;//结婚证
    private List<String> bookletUrls; //户口
    private List<String> stateUrls; //房产证或购房了同
    private List<String> justetterUrls; //正信
    private List<String> shopCardUrls; //营业执照
    private List<String> legalCardUrls;//法人身份证
    private List<String> houseUrls;   //购房合同
    private List<String> sitePicUrls; //场地照片
    private List<String> waterUrls;//6个月流水
    private List<String> staffUrls;//员工身份证 和联系方式
    private List<String> doorPicUrls;//门头照片
    private List<String> exhibitionPicUrls;//展厅内照片
    private List<String> backgroundPicUrls;//背景墙照片
    private List<String> capitalVerification;
    private List<String> frgdID;
    private List<String> zcxzHardCopy;
    private List<String> gcSynopsis;
    private List<String> yearReportForms;
    private List<String> monthReportForms;
    private List<String> monthAchievement;
    private List<String> loanBankFlow;
    private List<String> receivingBankFlow;
    private List<String> receivedPayments;
    private List<String> enterpriseStream;
    private List<String> customerCase;
    private List<String> mainBusiness;
    private List<String> manageProcedure;
    private List<String> vehicleEvaluationCriteria;
    private List<String> partner;
    private List<String> productMix;
    private List<String> managementSystem;
    private List<String> businessLedger;
    private List<String> organizationCode;
    private List<String> companyProfile;
    private List<String> taxRegistration;
    private List<String> actualControllerCreditReport;
    private List<String> enterpriseCreditReport;
    private List<String> corporateProfitModel;
    private List<String> assetProof;

    public List<String> getOrganizationCode() {
        return organizationCode;
    }

    public void setOrganizationCode(List<String> organizationCode) {
        this.organizationCode = organizationCode;
    }

    public List<String> getCompanyProfile() {
        return companyProfile;
    }

    public void setCompanyProfile(List<String> companyProfile) {
        this.companyProfile = companyProfile;
    }

    public List<String> getTaxRegistration() {
        return taxRegistration;
    }

    public void setTaxRegistration(List<String> taxRegistration) {
        this.taxRegistration = taxRegistration;
    }

    public List<String> getActualControllerCreditReport() {
        return actualControllerCreditReport;
    }

    public void setActualControllerCreditReport(List<String> actualControllerCreditReport) {
        this.actualControllerCreditReport = actualControllerCreditReport;
    }

    public List<String> getEnterpriseCreditReport() {
        return enterpriseCreditReport;
    }

    public void setEnterpriseCreditReport(List<String> enterpriseCreditReport) {
        this.enterpriseCreditReport = enterpriseCreditReport;
    }

    public List<String> getCorporateProfitModel() {
        return corporateProfitModel;
    }

    public void setCorporateProfitModel(List<String> corporateProfitModel) {
        this.corporateProfitModel = corporateProfitModel;
    }

    public List<String> getAssetProof() {
        return assetProof;
    }

    public void setAssetProof(List<String> assetProof) {
        this.assetProof = assetProof;
    }

    public List<String> getCapitalVerification() {
        return capitalVerification;
    }

    public void setCapitalVerification(List<String> capitalVerification) {
        this.capitalVerification = capitalVerification;
    }

    public List<String> getFrgdID() {
        return frgdID;
    }

    public void setFrgdID(List<String> frgdID) {
        this.frgdID = frgdID;
    }

    public List<String> getZcxzHardCopy() {
        return zcxzHardCopy;
    }

    public void setZcxzHardCopy(List<String> zcxzHardCopy) {
        this.zcxzHardCopy = zcxzHardCopy;
    }

    public List<String> getGcSynopsis() {
        return gcSynopsis;
    }

    public void setGcSynopsis(List<String> gcSynopsis) {
        this.gcSynopsis = gcSynopsis;
    }

    public List<String> getYearReportForms() {
        return yearReportForms;
    }

    public void setYearReportForms(List<String> yearReportForms) {
        this.yearReportForms = yearReportForms;
    }

    public List<String> getMonthReportForms() {
        return monthReportForms;
    }

    public void setMonthReportForms(List<String> monthReportForms) {
        this.monthReportForms = monthReportForms;
    }

    public List<String> getMonthAchievement() {
        return monthAchievement;
    }

    public void setMonthAchievement(List<String> monthAchievement) {
        this.monthAchievement = monthAchievement;
    }

    public List<String> getLoanBankFlow() {
        return loanBankFlow;
    }

    public void setLoanBankFlow(List<String> loanBankFlow) {
        this.loanBankFlow = loanBankFlow;
    }

    public List<String> getReceivingBankFlow() {
        return receivingBankFlow;
    }

    public void setReceivingBankFlow(List<String> receivingBankFlow) {
        this.receivingBankFlow = receivingBankFlow;
    }

    public List<String> getReceivedPayments() {
        return receivedPayments;
    }

    public void setReceivedPayments(List<String> receivedPayments) {
        this.receivedPayments = receivedPayments;
    }

    public List<String> getEnterpriseStream() {
        return enterpriseStream;
    }

    public void setEnterpriseStream(List<String> enterpriseStream) {
        this.enterpriseStream = enterpriseStream;
    }

    public List<String> getCustomerCase() {
        return customerCase;
    }

    public void setCustomerCase(List<String> customerCase) {
        this.customerCase = customerCase;
    }

    public List<String> getMainBusiness() {
        return mainBusiness;
    }

    public void setMainBusiness(List<String> mainBusiness) {
        this.mainBusiness = mainBusiness;
    }

    public List<String> getManageProcedure() {
        return manageProcedure;
    }

    public void setManageProcedure(List<String> manageProcedure) {
        this.manageProcedure = manageProcedure;
    }

    public List<String> getVehicleEvaluationCriteria() {
        return vehicleEvaluationCriteria;
    }

    public void setVehicleEvaluationCriteria(List<String> vehicleEvaluationCriteria) {
        this.vehicleEvaluationCriteria = vehicleEvaluationCriteria;
    }

    public List<String> getPartner() {
        return partner;
    }

    public void setPartner(List<String> partner) {
        this.partner = partner;
    }

    public List<String> getProductMix() {
        return productMix;
    }

    public void setProductMix(List<String> productMix) {
        this.productMix = productMix;
    }

    public List<String> getManagementSystem() {
        return managementSystem;
    }

    public void setManagementSystem(List<String> managementSystem) {
        this.managementSystem = managementSystem;
    }

    public List<String> getBusinessLedger() {
        return businessLedger;
    }

    public void setBusinessLedger(List<String> businessLedger) {
        this.businessLedger = businessLedger;
    }

    public List<String> getDoorPicUrls() {
        return doorPicUrls;
    }

    public void setDoorPicUrls(List<String> doorPicUrls) {
        this.doorPicUrls = doorPicUrls;
    }

    public List<String> getExhibitionPicUrls() {
        return exhibitionPicUrls;
    }

    public void setExhibitionPicUrls(List<String> exhibitionPicUrls) {
        this.exhibitionPicUrls = exhibitionPicUrls;
    }

    public List<String> getBackgroundPicUrls() {
        return backgroundPicUrls;
    }

    public void setBackgroundPicUrls(List<String> backgroundPicUrls) {
        this.backgroundPicUrls = backgroundPicUrls;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public List<String> getIdCardUrls() {
        return idCardUrls;
    }

    public void setIdCardUrls(List<String> idCardUrls) {
        this.idCardUrls = idCardUrls;
    }

    public List<String> getWiddingOrDiv() {
        return widdingOrDiv;
    }

    public void setWiddingOrDiv(List<String> widdingOrDiv) {
        this.widdingOrDiv = widdingOrDiv;
    }

    public List<String> getBookletUrls() {
        return bookletUrls;
    }

    public void setBookletUrls(List<String> bookletUrls) {
        this.bookletUrls = bookletUrls;
    }

    public List<String> getStateUrls() {
        return stateUrls;
    }

    public void setStateUrls(List<String> stateUrls) {
        this.stateUrls = stateUrls;
    }

    public List<String> getJustetterUrls() {
        return justetterUrls;
    }

    public void setJustetterUrls(List<String> justetterUrls) {
        this.justetterUrls = justetterUrls;
    }

    public List<String> getShopCardUrls() {
        return shopCardUrls;
    }

    public void setShopCardUrls(List<String> shopCardUrls) {
        this.shopCardUrls = shopCardUrls;
    }

    public List<String> getLegalCardUrls() {
        return legalCardUrls;
    }

    public void setLegalCardUrls(List<String> legalCardUrls) {
        this.legalCardUrls = legalCardUrls;
    }

    public List<String> getHouseUrls() {
        return houseUrls;
    }

    public void setHouseUrls(List<String> houseUrls) {
        this.houseUrls = houseUrls;
    }

    public List<String> getSitePicUrls() {
        return sitePicUrls;
    }

    public void setSitePicUrls(List<String> sitePicUrls) {
        this.sitePicUrls = sitePicUrls;
    }

    public List<String> getWaterUrls() {
        return waterUrls;
    }

    public void setWaterUrls(List<String> waterUrls) {
        this.waterUrls = waterUrls;
    }

    public List<String> getStaffUrls() {
        return staffUrls;
    }

    public void setStaffUrls(List<String> staffUrls) {
        this.staffUrls = staffUrls;
    }
}
