package com.nastation.pm;

public interface Global {

    // --------Task Status -----
    // 此状态的值必须对应t_issue_status中的id
    int OPEN = 1;
    int IN_PROGRESS = 2;
    int REOPEN = 3;
    int RESOLVED = 4;
    int CLOSE = 5;

    /** 如果值为1，即为resolution默认选项 */
    int RESOLUTION_DEFAULT = 1;

    // ---------- key in session -------------
    String SESSION_FILTER = "SESSION_FILTER_KEY";
    String SESSION_USER = "SESSION_USER_KEY";

}
