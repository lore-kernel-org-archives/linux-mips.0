Reply-To: <a.voropay@vmb-service.ru>
From: "Alec Voropay" <a.voropay@vmb-service.ru>
Subject: RE: Kernel conversion problem ELF -> ECOFF
Date: Mon, 25 Oct 2004 14:03:37 +0400
Message-ID: <01aa01c4ba79$e87557f0$1701a8c0@vmbservice.ru>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
In-Reply-To: <417C2BB1.9030105@pain-net.home>
Return-Path: <a.voropay@vmb-service.ru>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: 'Stefan Deling' <stefan.deling@web.de>, linux-mips@linux-mips.org
Message-ID: <20041025100337.VbNW1jgx_XZKu_2FuCnyjkTmXHiDMIAB7Dw25VkOiJ0@z>


> elf2ecoof told me:
> "programm header type 3 1694766464 can´t be converted!"
> Has anyone got a solution for this problem??

 Try to use "objcopy" unility ftom the your toolchain.

$ objcopy -O ecoff-littlemips   kernel.elf    kernel.ecoff

(or see man objcopy about -O....  formats )


--
-=AV=-
