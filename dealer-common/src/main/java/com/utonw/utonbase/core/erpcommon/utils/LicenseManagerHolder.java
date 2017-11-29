package com.utonw.utonbase.core.erpcommon.utils;

import de.schlichtherle.license.LicenseManager;
import de.schlichtherle.license.LicenseParam;

/**
 * Created by WANGYJ
 */
public class LicenseManagerHolder {
    private static LicenseManager licenseManager;

    public static synchronized LicenseManager getLicenseManager(LicenseParam licenseParams) {
        if (licenseManager == null) {
            licenseManager = new LicenseManager(licenseParams);
        }
        return licenseManager;
    }
}
