Message-ID: <01da01c2a7d9$1de6c500$e20310ac@gv.com.tw>
From: "??" <kevin@gv.com.tw>
References: <011c01c29c54$7aa64c60$e20310ac@gv.com.tw> <20021205132358.A5634@linux-mips.org>
Subject: [help] exec_usermodehelper() then content of CURRENT is destroyed
Date: Fri, 20 Dec 2002 11:37:26 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <kevin@gv.com.tw>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Cc: cms@gv.com.tw
Message-ID: <20021220033726.xtVn-ffIj3ADVNLdsx-isymtmb7x5kbgu_JPDPXqzhs@z>

dear all,

1)in our 2.4.18 mips kernel , when we call  exec_usermodehelper() (in
kernel/kmod.c)
the content of CURRENT is destroyed during [page_fault handler loading pages
from storage-device to ram]

which kind of error may cause this problem?
any hint/idea?

2)btw, in some mips linux port,
[syscall] is done by [scall_o32.S]
when [handle_sys] is done,
it will return by [o32_ret_from_sys_call],
[o32_ret_from_sys_call] will do [reschedule] and [signal],
but the question is here it doesn't check whether [syscall] is from
User-space or Kernel-space
if we use [syscall] in kernel-space, and do [signal] after [syscall] return,
won't it cause problem? is this bug of linux code?

thanks alot in advanced!
