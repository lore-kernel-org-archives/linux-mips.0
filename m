From: "=?utf-8?Q?=E6=9C=B1=E5=87=A4\=28zhufeng\=29?="
	<zhufeng@koretide.com.cn>
Subject: RE: gdbserver and gdb debugging stub for mips 
Date: Mon, 18 Aug 2003 09:16:06 +0800
Message-ID: <MGEELAPMEFMLFBMDBLKLGEKOCEAA.zhufeng@koretide.com.cn>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20030815150755.C4DCAC59E4@atlas.denx.de>
Return-Path: <zhufeng@koretide.com.cn>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: wd@denx.de
Cc: Wilson Chan <wilsonc@cellvision1.com.tw>, linux-mips@linux-mips.org
Message-ID: <20030818011606.RRra21tfFG9q6rwqbYKgUmjW_vtOLCKpg-FVrWNl-OQ@z>

when I build my mips program using gcc with -O0 , it is ok, while using -o2, there come the following questions.
lingking,,,

relocation truncated to fit: R_MIPS_GPREL16  __global_ctor_start
relocation truncated to fit: R_MIPS_GPREL16 __global_ctor_end
relocation truncated to fit: R_MIPS_GPREL16 _recycle_start 

and so on.

Has anybody encounter such questions?



-----Original Message-----
From: wd@denx.de [mailto:wd@denx.de]
Sent: 2003年8月15日 23:08
To: Öì·ï
Cc: Wilson Chan; linux-mips@linux-mips.org
Subject: Re: gdbserver and gdb debugging stub for mips 


In message <MGEELAPMEFMLFBMDBLKLIEKICEAA.zhufeng@koretide.com.cn> you wrote:
>  what do you mean by "MIPS is NOT MIPS"? Does it mean there are too many mips boards?

big endian, little endian, 32 bit, 64 bit, ...

It means that there are several  different  configurations,  and  you
must use tools to match your configuration.

Best regards,

Wolfgang Denk

-- 
Software Engineering:  Embedded and Realtime Systems,  Embedded Linux
Phone: (+49)-8142-4596-87  Fax: (+49)-8142-4596-88  Email: wd@denx.de
Newer disks don't have a rectangular layout anymore,  but  Unix  (and
SunOS) still assumes this.     - Peter Koch in <koch.779356598@rhein>
