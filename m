Message-ID: <013701c144d9$af44d3c0$361e690a@huawei.com>
From: "renc stone" <renwei@huawei.com>
Subject: recent gdb add-symbol-file problem?
Date: Mon, 24 Sep 2001 17:17:07 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="gb2312"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: gcc@gnu.org
Cc: linux-mips@oss.sgi.com
Message-ID: <20010924091707.vJwePwaWz_wJeJ_y29_TkhiuyMf-InjmboZIQ7FL4rw@z>

hi ,
 I use gdb 20010919 source form sources.redhat.com,
 target mipsel, host i386 box.

When I want to use this to debug some module of linux-mips kernel ,
trouble comes:

When I use the add-symbol-file command to add the symbols of module,

add-symbol-file mymodule.o 0xc001e060
gdb echos no problem,
but it seems to be confused:
the command
b my_func1
b my_func2
b my_func3

all show the same address, all the functions starts from ONE place?
I checked the address, it's the text section start address of this module.
Can't the gdb  correctly read the elf file of mipsel ?

 Any ideas?  Or anyone who have done this  please tell me how to get through
it .
