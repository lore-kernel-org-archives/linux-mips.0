Message-ID: <20050404134918.29726.qmail@web15804.mail.cnb.yahoo.com>
Date: Mon, 4 Apr 2005 21:49:18 +0800 (CST)
From: dfsd df <tomcs163@yahoo.com.cn>
Subject: Re: questions about early-printk
In-Reply-To: 6667
MIME-Version: 1.0
Content-Type: text/plain; charset=gb2312
Content-Transfer-Encoding: 8bit
Return-Path: <tomcs163@yahoo.com.cn>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20050404134918.ksqtP00YSC6NAESW60qpwlk8376r0ocxk9Zir2vaTL0@z>

Sorry, It's still Malta board, MIPS4Kc cpu. the UART
is ti16c550c.

The source code at junsun.net is :
------------------------------------------------------
#include "uart16550.h" 

/* === CONFIG === */ 

#define BASE 0xb0000080
------------------------------------------------------
