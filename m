Message-ID: <00da01c333f9$498b11f0$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <20030616093215Z8225220-1272+2626@linux-mips.org>
Subject: Re: bootloader problem
Date: Mon, 16 Jun 2003 13:20:02 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="GB2312"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: He Jin <thesistarball@yahoo.com.cn>, linux-mips@linux-mips.org
Message-ID: <20030616112002.M5h7wppz3_MNDKuY7oxf5C-LzXlkDP2NnWTaiEkEkyg@z>


> I met a problem when debuging a bootloader in IT8172G+RM5231A platform, it's like this:
> 
> the bootloader had 2 parts, the first part executes in ROM (0xbfc00000-0xbfc0xxxx) and
> it move another part from ROM into SDRAM, then jump to the SDRAM entry point to continue.
> 
> In the ROM resident code, if I initialized&flushed the cache, it can jump to SDRAM entry
> continue normally. However,if I comment out those cache related code and make cache disabled, 
> it seems can not jump to SDRAM entry. 
> 
> Who can tell me why I must initialize&flush when cache disabled ? 

Precisely what do you mean by "cache disabled",
and what is the address of the SDRAM entry?

            Kevin K.
