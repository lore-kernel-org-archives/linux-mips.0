Message-ID: <000701c11c8b$77e039e0$8021690a@huawei.com>
From: "machael thailer" <dony.he@huawei.com>
Subject: Where is the first entry point for linux-mips boot?
Date: Sat, 4 Aug 2001 10:16:27 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: linux-mips@oss.sgi.com
Message-ID: <20010804021627.V85WeG6kIODzQjloC1qUHcN1PzGQLQ-in4P41bzl10Q@z>

Hello,all:

    Now I plan to port linux on our mips-based board. Since it is the first
time for me to work on linux-mips, I have several questions to ask:

    There are many many subdirectories in arch/mips, I don't know where is
the FIRST entry point for embedded linux-mips boot process? I find that
there is "kernel_entry" in arch/mips/kernel/head.S. I know this is the entry
point for linux kernel ,but it is not the FIRST entry point for embedded
linux-mips boot process. So my questions is :
    After the board initializations finish, it should load linux kernel into
RAM and jump there .  Just before it runs the linux kernel, who calls
"kernel_entry"?
    I don't know whether I have expressed my meaning apparently. Hope you
can understand me.

Thank you very much.

machael thailer
