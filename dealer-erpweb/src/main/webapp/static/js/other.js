
    /**
     * 格式化金额s表示需要格式化的数据，n表示小数点后需要保留几位
     * @param n 表示小数点后需要保留几位
     * @param s 需要格式化的数据
     * @returns {string}
     */
    format_money = function (s, n) {
        n = n > 0 && n <= 20 ? n : 2;
        s = parseFloat((s + "").replace(/[^\d\.-]/g, "")).toFixed(n) + "";
        var l = s.split(".")[0].split("").reverse(),
            r = s.split(".")[1];
        t = "";
        for (i = 0; i < l.length; i++) {
            t += l[i] + ((i + 1) % 3 == 0 && (i + 1) != l.length ? "," : "");
        }
        return t.split("").reverse().join("") + "." + r;
    };


    /**
     * 保留四位小数
     * */
    changeFourDecimal = function(x) {
        var f_x = parseFloat(x);
        if (isNaN(f_x)) {
            return false;
        }
        var f_x = Math.round(x * 10000) / 10000;
        return f_x;
    };

    /**
     * 除法函数
     * @param arg1
     * @param arg2
     * @returns {number}
     */
    accDiv = function (arg1, arg2) {
        var t1 = 0, t2 = 0, r1, r2, n;
        try {
            t1 = arg1.toString().split(".")[1].length;
        }
        catch (e) {
            t1 = 0;
        }
        try {
            t2 = arg2.toString().split(".")[1].length;
        }
        catch (e) {
            t2 = 0;
        }
        with (Math) {
            r1 = Number(arg1.toString().replace(".", ""));
            r2 = Number(arg2.toString().replace(".", ""));
            n = Math.max(t1, t2);
            return (r1 / r2) * pow(10, t2 - t1);
        }
    }

    /**
     * 乘法函数
     * @param arg1
     * @param arg2
     * @returns {number}
     */
    accMul = function(arg1, arg2) {
        var t1 = 0, t2 = 0, r1, r2;
        try {
            t1 = arg1.toString().split(".")[1].length;
        }
        catch (e) {
            t1 = 0;
        }
        try {
            t2 = arg2.toString().split(".")[1].length;
        }
        catch (e) {
            t2 = 0;
        }
        with (Math) {
            r1 = Number(arg1.toString().replace(".", ""));
            r2 = Number(arg2.toString().replace(".", ""));
            return (r1 * r2) / pow(10, t2 + t1);
        }
    }



/**
 * 给String类型增加一个div方法，使用时arg1.div(arg2)
 * @param arg
 * @returns {number}
 */
String.prototype.div = function (arg) {
    return accDiv(this, arg);
};

Date.prototype.Format = function (fmt) {
    var o = {
        "M+": this.getMonth() + 1, //月份
        "d+": this.getDate(), //日
        "h+": this.getHours(), //小时
        "m+": this.getMinutes(), //分
        "s+": this.getSeconds(), //秒
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度
        "S": this.getMilliseconds() //毫秒
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
        if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
};

/**
 * 给String类型增加一个mul方法，使用时arg1.mul(arg2)
 * @param arg
 * @returns {number}
 */
String.prototype.mul = function (arg) {
    return accMul(arg, this);
};

/**
 * 给String类型增加一个add方法，使用时arg1.add(arg2)
 * @param arg
 * @returns {number}
 */
String.prototype.add = function (arg) {
    return accAdd(arg, this);
};

/**
 * 给String类型增加一个subtr方法，使用时arg1.subtr(arg2)
 * @param arg
 * @returns {number}
 */
String.prototype.subtr = function (arg) {
    return accSubtr(this, arg);
};

/**
 * string 转 date
 * */
function strToDate(str) {
    var d = new Date(str.replace(/-/g, "/"));
    return d;
}

/**
 * 保留2位小数
 * */
function changeTwoDecimal(x) {
    var f_x = parseFloat(x);
    if (isNaN(f_x)) {
        return false;
    }
    var f_x = Math.round(x * 100) / 100;
    return f_x;
}

/**
 * 保留四位小数
 * */
function changeFourDecimal(x) {
    var f_x = parseFloat(x);
    if (isNaN(f_x)) {
        return false;
    }
    var f_x = Math.round(x * 10000) / 10000;
    return f_x;
}

/**
 *  JS 日期加减
 *  var now = new Date();
 now.addDays(1);//加减日期操作
 alert(now.Format("yyyy-MM-dd"));
 * @param fmt
 * @returns
 */
Date.prototype.Format = function (fmt) {
    var o =
    {
        "M+": this.getMonth() + 1, //月份
        "d+": this.getDate(), //日
        "h+": this.getHours(), //小时
        "m+": this.getMinutes(), //分
        "s+": this.getSeconds(), //秒
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度
        "S": this.getMilliseconds() //毫秒
    };
    if (/(y+)/.test(fmt))
        fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
        if (new RegExp("(" + k + ")").test(fmt))
            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
};


Date.prototype.addDays = function (d) {
    this.setDate(this.getDate() + d);
};


Date.prototype.addWeeks = function (w) {
    this.addDays(w * 7);
};


Date.prototype.addMonths = function (m) {
    var d = this.getDate();
    this.setMonth(this.getMonth() + m);

    if (this.getDate() < d)
        this.setDate(0);
};


Date.prototype.addYears = function (y) {
    var m = this.getMonth();
    this.setFullYear(this.getFullYear() + y);

    if (m < this.getMonth()) {
        this.setDate(0);
    }
};
/**
 * 格式化数字(四舍五入)
 * @param num 要格式化的数字
 * @param n 保留小数位
 * @returns {string}
 */
function formatNum(num, n) {
    num = String(num.toFixed(n));
    var re = /(-?\d+)(\d{3})/;
    while (re.test(num)) num = num.replace(re, "$1,$2")
    return num;
}

/**
 * 格式化金额
 * @param s 表示需要格式化的数据
 * @param n 表示小数点后需要保留几位
 * @returns {string}
 */
var format_money = function (s, n) {
    n = n > 0 && n <= 20 ? n : 2;
    s = parseFloat((s + "").replace(/[^\d\.-]/g, "")).toFixed(n) + "";
    var l = s.split(".")[0].split("").reverse(),
        r = s.split(".")[1];
    t = "";
    for (i = 0; i < l.length; i++) {
        t += l[i] + ((i + 1) % 3 == 0 && (i + 1) != l.length ? "," : "");
    }
    return t.split("").reverse().join("") + "." + r;
};

/**
 * 格式化金额复原
 * @param s
 * @returns {Number}
 */
var rmoney = function (s) {
    s = s + "";
    return parseFloat(s.replace(/[^\d\.-]/g, ""));
};

/**
 * 将阿拉伯数字的金额转为中文
 * @param numberValue 需要转化的金额
 * @returns {string}
 */
function atoc(numberValue) {
    var numberValue = new String(Math.round(numberValue * 100)); // 数字金额
    var chineseValue = ""; // 转换后的汉字金额
    var String1 = "零壹贰叁肆伍陆柒捌玖"; // 汉字数字
    var String2 = "万仟佰拾亿仟佰拾万仟佰拾元角分"; // 对应单位
    var len = numberValue.length; // numberValue 的字符串长度
    var Ch1; // 数字的汉语读法
    var Ch2; // 数字位的汉字读法
    var nZero = 0; // 用来计算连续的零值的个数
    var String3; // 指定位置的数值
    if (len > 15) {
        //alert("超出计算范围");
        return "";
    }
    if (numberValue == 0) {
        chineseValue = "零元整";
        return chineseValue;
    }

    String2 = String2.substr(String2.length - len, len); // 取出对应位数的STRING2的值
    for (var i = 0; i < len; i++) {
        String3 = parseInt(numberValue.substr(i, 1), 10); // 取出需转换的某一位的值
        if (i != (len - 3) && i != (len - 7) && i != (len - 11) && i != (len - 15)) {
            if (String3 == 0) {
                Ch1 = "";
                Ch2 = "";
                nZero = nZero + 1;
            }
            else if (String3 != 0 && nZero != 0) {
                Ch1 = "零" + String1.substr(String3, 1);
                Ch2 = String2.substr(i, 1);
                nZero = 0;
            }
            else {
                Ch1 = String1.substr(String3, 1);
                Ch2 = String2.substr(i, 1);
                nZero = 0;
            }
        }
        else { // 该位是万亿，亿，万，元位等关键位
            if (String3 != 0 && nZero != 0) {
                Ch1 = "零" + String1.substr(String3, 1);
                Ch2 = String2.substr(i, 1);
                nZero = 0;
            }
            else if (String3 != 0 && nZero == 0) {
                Ch1 = String1.substr(String3, 1);
                Ch2 = String2.substr(i, 1);
                nZero = 0;
            }
            else if (String3 == 0 && nZero >= 3) {
                Ch1 = "";
                Ch2 = "";
                nZero = nZero + 1;
            }
            else {
                Ch1 = "";
                Ch2 = String2.substr(i, 1);
                nZero = nZero + 1;
            }
            if (i == (len - 11) || i == (len - 3)) { // 如果该位是亿位或元位，则必须写上
                Ch2 = String2.substr(i, 1);
            }
        }
        chineseValue = chineseValue + Ch1 + Ch2;
    }

    if (String3 == 0) { // 最后一位（分）为0时，加上“整”
        chineseValue = chineseValue + "整";
    }

    return chineseValue;
}

/**
 * 除法函数
 * @param arg1
 * @param arg2
 * @returns {number}
 */
function accDiv(arg1, arg2) {
    var t1 = 0, t2 = 0, r1, r2, n;
    try {
        t1 = arg1.toString().split(".")[1].length;
    }
    catch (e) {
        t1 = 0;
    }
    try {
        t2 = arg2.toString().split(".")[1].length;
    }
    catch (e) {
        t2 = 0;
    }
    with (Math) {
        r1 = Number(arg1.toString().replace(".", ""));
        r2 = Number(arg2.toString().replace(".", ""));
        n = Math.max(t1, t2);
        return (r1 / r2) * pow(10, t2 - t1);
    }
}

/**
 * 乘法函数
 * @param arg1
 * @param arg2
 * @returns {number}
 */
function accMul(arg1, arg2) {
    var t1 = 0, t2 = 0, r1, r2;
    try {
        t1 = arg1.toString().split(".")[1].length;
    }
    catch (e) {
        t1 = 0;
    }
    try {
        t2 = arg2.toString().split(".")[1].length;
    }
    catch (e) {
        t2 = 0;
    }
    with (Math) {
        r1 = Number(arg1.toString().replace(".", ""));
        r2 = Number(arg2.toString().replace(".", ""));
        return (r1 * r2) / pow(10, t2 + t1);
    }
}

/**
 * 加法函数
 * @param arg1
 * @param arg2
 * @returns {number}
 */
function accAdd(arg1, arg2) {
    var t1 = 0, t2 = 0, m;
    try {
        t1 = arg1.toString().split(".")[1].length;
    }
    catch (e) {
        t1 = 0;
    }
    try {
        t2 = arg2.toString().split(".")[1].length;
    }
    catch (e) {
        t2 = 0;
    }
    with (Math) {
        m = Math.pow(10, Math.max(t1, t2));
        return (arg1 * m + arg2 * m) / m;
    }
}

/**
 * 减法函数
 * @param arg1
 * @param arg2
 * @returns {string}
 */
function accSubtr(arg1, arg2) {
    var t1 = 0, t2 = 0, m, n;
    try {
        t1 = arg1.toString().split(".")[1].length;
    }
    catch (e) {
        t1 = 0;
    }
    try {
        t2 = arg2.toString().split(".")[1].length;
    }
    catch (e) {
        t2 = 0;
    }
    with (Math) {
        //动态控制精度长度
        n = Math.max(t1, t2);
        m = Math.pow(10, n);
        //return (arg1  * m - arg2 * m) / m;
        return ((arg1 * m - arg2 * m) / m).toFixed(n);
    }
}


