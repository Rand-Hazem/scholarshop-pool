package com.iteam.scholarships.enums;

public enum AccountState {

    /**
     * Student or Advertiser on active state
     */
    ACTIVE,

    /**
     * Student or Advertiser may be blocked for admin
     */
    BLOCKED,

    /**
     * Advertiser when register but still not approved by the admin
     */
    PENDING_APPROVAL;
    }