Date: Mon, 16 Jun 2003 17:32:40 +0800
From: "He Jin" <thesistarball@yahoo.com.cn>
Subject: bootloader problem
Mime-Version: 1.0
Content-Type: text/plain;
      charset="GB2312"
Content-Transfer-Encoding: 7bit
Message-ID: <20030616093215Z8225220-1272+2626@linux-mips.org>
Return-Path: <thesistarball@yahoo.com.cn>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.orglinux-mips@linux-mips.org
Message-ID: <20030616093240.uqn0LWrTocf4Mx16Mk670Jts9dXz_EYsYVzZKlNeyDs@z>

Hi, everybody,

I met a problem when debuging a bootloader in IT8172G+RM5231A platform, it's like this:

the bootloader had 2 parts, the first part executes in ROM (0xbfc00000-0xbfc0xxxx) and
it move another part from ROM into SDRAM, then jump to the SDRAM entry point to continue.

In the ROM resident code, if I initialized&flushed the cache, it can jump to SDRAM entry
continue normally. However,if I comment out those cache related code and make cache disabled, 
it seems can not jump to SDRAM entry. 

Who can tell me why I must initialize&flush when cache disabled ? 

Thanks a lot!

He Jin	
