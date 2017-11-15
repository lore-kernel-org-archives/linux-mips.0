Received: from 19pmail.ess.barracuda.com ([64.235.150.244]:49927 "EHLO
        19pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992186AbdKOO5QT-Kec (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 15 Nov 2017 15:57:16 +0100
Date: Wed, 15 Nov 2017 14:53:33 +0000
From: "Maciej W. Rozycki" <macro@mips.com>
Subject: Re: [PATCH] MIPS: Fix exception entry when CONFIG_EVA enabled
In-Reply-To: <alpine.DEB.2.00.1711151334200.3893@tp.orcam.me.uk>
Message-ID: <alpine.DEB.2.00.1711151425100.3893@tp.orcam.me.uk>
References: <1507712360-20657-1-git-send-email-matt.redfearn@mips.com> <605f6a96-a843-085c-efc6-a2c0f2afd84a@mvista.com> <20171031234853.GD15260@jhogan-linux> <alpine.DEB.2.00.1711131045460.3893@tp.orcam.me.uk> <9a2d2b4b-9b6a-a7e2-78be-ff6a019d6e05@mips.com>
 <alpine.DEB.2.00.1711151334200.3893@tp.orcam.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <Maciej.Rozycki@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Matt Redfearn <matt.redfearn@mips.com>
Cc: James Hogan <james.hogan@mips.com>, Corey Minyard <cminyard@mvista.com>, Ralf Baechle <ralf@linux-mips.org>, Matthew Fortune <matthew.fortune@mips.com>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, "Jason A. Donenfeld" <jason@zx2c4.com>, Paul Burton <paul.burton@mips.com>
Message-ID: <20171115145333.UaOQ_g6nAS6fi1vouVkqAvEgcrf-gjBnZVvEKEnoDUA@z>

Hi Matt,

On Wed, 15 Nov 2017, Maciej W. Rozycki wrote:

>  Can you send me .i output from the offending source along with GCC 
> options used to make .o output (use `V=1' with `make' if needed)?  I'll 
> check if my hypothesis is right or find the actual cause otherwise.

 Thanks for the pieces requested.

 I can see what is going on here: the problem is the source is built with 
no optimisation enabled.  Consequently GAS does not schedule delay slots 
itself.  I wasn't aware we had this problem with kernel build flags -- it 
certainly affects more than just this piece of code.

 For GAS to schedule delay slots it has to be passed -O2 by the GCC 
driver.  The driver in turn will pass -O2 to GAS whenever at least -O has 
been used.  By default -O1 is passed, which only enables the removal of 
unnecessary NOPs, i.e. those that have been inserted precautionarily for 
execution hazard avoidance in the assembly pass and in the end turned out 
unnecessary and can be optionally removed in the relaxation pass.  NB 
GAS's default is actually -O2, i.e. when invoked directly, however this is 
overridden by the GCC driver as described.

 My recommendation would be using just the same CFLAGS for assembly 
sources that are used for C language sources; the GCC driver will silently 
filter out options that are irrelevant and interpret all the options that 
do have relevance.  This may be important for various `-f<foo>' and 
`-m<bar>' options which may sometimes affect assembly generation and, for 
that matter, multilib selection.

 This also means all CFLAGS should be passed to the linker as well, 
because again, they may affect linker options.

 So if you stick say `-O2' with your compiler invocation, for the purpose 
of this consideration possibly just like this:

$ make AFLAGS_genex.o=-O2 arch/mips/kernel/genex.o

then you should get the delay slot in question (and any other ones) 
scheduled.  Indeed with this build recipe applied I can already see a 
small code size reduction in `genex.o' even without your change:

$ size arch/mips/kernel/genex-?.o
   text	   data	    bss	    dec	    hex	filename
   8236	     48	      0	   8284	   205c	arch/mips/kernel/genex-0.o
   8204	     48	      0	   8252	   203c	arch/mips/kernel/genex-1.o
$

 HTH,

  Maciej
