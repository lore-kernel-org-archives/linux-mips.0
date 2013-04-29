Received: from blu0-omc4-s28.blu0.hotmail.com ([65.55.111.167]:7120 "EHLO
        blu0-omc4-s28.blu0.hotmail.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6821703Ab3D2IpudRe10 convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 29 Apr 2013 10:45:50 +0200
Message-ID: <BLU176-W15FDDC553391B906C42E1AD2B20@phx.gbl>
From: shawn Bai <programassem@hotmail.com>
Subject: Confused on cache_op(op,addr) definition in r4kcache.h in linux
 source code v3.3.5
Date: Mon, 29 Apr 2013 08:45:44 +0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Return-Path: <programassem@hotmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>
Cc: "baixy_009@163.com" <baixy_009@163.com>, "programassem@gmail.com" <programassem@gmail.com>
Message-ID: <20130429084544.6Niu0H6K1W0c97pjnvIpz0RhLSKZ-Gzi2zD6x7I3h1Y@z>

Hello, everyone,

    I'm very glag to have chance to communicate with you in this maling list.

    I'm involved in a SOC project making use of MIPS24K core.
    While learning the CACHE aspects in Linux kernel source code v3.3.5,  I found the macro definition for cache operations.

     It goes as:

#define cache_op(op,addr)                        \
    __asm__ __volatile__(                        \
    "    .set    push                    \n"    \
    "    .set    noreorder                \n"    \
    "    .set    mips3\n\t                \n"    \
    "    cache    %0, %1                    \n"    \
    "    .set    pop                    \n"    \
    :                                \
    : "i" (op), "R" (*(unsigned char *)(addr)))


  "i" (op)   as argument 0 in CACHE instruction,
  "R" (*(unsigned char *)(addr))   as argument 1 in CACHE instruction


  Further, on the other hand, the CACHE instruction in MIPS ISA is like this:

Format:      CACHE op, offset(base)

Purpose: Perform Cache Operation

To perform the cache operation specified by op.

  And as know,  depending on the  op field,   the offset(base) coud be understood accordingly for different meanings.

Well, after the context, here below is what makes me confused.

In the cache_op inline assembly,   
why "R" (*(unsigned char *)(addr))   is used as the argument 1 of CACHE instruction, instead of   "R" ((unsigned char *)(addr)) ?

the argument 1 numbered from 0  in CACHE instruction in MIPS ISA  should be a address with a offset,  but from the code,  it seems that the value in that address  is passed to CACHE instruction.

Could someone give some help on this?  
I really appreciate that.
Thanks in advance.




Best regards,
Shawn Bai 		 	   		  
