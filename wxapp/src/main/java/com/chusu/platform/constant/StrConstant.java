package com.chusu.platform.constant;

public interface StrConstant {

    String PAGE = "page";

    String USER = "user";

    String MENUID = "menuId";

    /** openId标识*/
    static final String OPENID = "openId";
    /** 文章标识*/
    static final String WENZHNAG = "wenzhangId";

    /** 客户信息表示*/
    static final String CUSTOMERINFO = "customerInfo";

    /** */
    static final String CONSUMER = "consumer";

    public interface status {
        // 未兑换
        static final String NOT_CONVERTED = "0";

        // 已兑换
        static final String CONVERTED = "1";

        // 下单付款未成功
        static final String ORDER_NOT_PAY = "2";

        // 下单付款成功
        static final String ORDER_PAY_SUCCESS = "3";

    }

    public interface code {
        // 未兑换
        static final String NOT_CONVERTED = "0";

        // 已兑换
        static final String CONVERTED = "1";

        // 下单付款未成功
        static final String ORDER_NOT_PAY = "2";

        // 下单付款成功
        static final String ORDER_PAY_SUCCESS = "3";

    }
}
