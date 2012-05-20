Received: from mail-pb0-f49.google.com ([209.85.160.49]:61497 "EHLO
        mail-pb0-f49.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1903541Ab2ETF1B (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sun, 20 May 2012 07:27:01 +0200
Received: by pbbrq13 with SMTP id rq13so6400313pbb.36
        for <linux-mips@linux-mips.org>; Sat, 19 May 2012 22:26:55 -0700 (PDT)
From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 2/2] spi: Add SPI master controller for OCTEON SOCs.
In-Reply-To: <4FB14B55.4070604@gmail.com>
References: <1336772086-17248-1-git-send-email-ddaney.cavm@gmail.com> <1336772086-17248-3-git-send-email-ddaney.cavm@gmail.com> <CAM=Q2csSQWbCOCQpubDok1=hmPvHU0MTEUg+-FGhp91=O5L6Hw@mail.gmail.com> <4FB14B55.4070604@gmail.com>
Date: Sat, 19 May 2012 23:26:53 -0600
Message-ID: <20120520052653.590673E03B8@localhost>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: David Daney <ddaney.cavm@gmail.com>, Shubhrajyoti Datta <omaplinuxkernel@gmail.com>
Cc: devicetree-discuss@lists.ozlabs.org, Rob Herring <rob.herring@calxeda.com>, spi-devel-general@lists.sourceforge.net, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Message-ID: <20120520052653.2fzXe4ConDND5qWEwvZ95119dINX8eg1JZOvnLqzI3I@z>

On Mon, 14 May 2012 11:13:41 -0700, David Daney <ddaney.cavm@gmail.com> wrote:
> On 05/13/2012 10:46 PM, Shubhrajyoti Datta wrote:
> > Hi David,
> > A few comments.
> >
> > On Sat, May 12, 2012 at 3:04 AM, David Daney<ddaney.cavm@gmail.com>  wrote:
> [...]
> 
> >> +
> >> +#define DRV_VERSION "2.0" /* Version 1 was the out-of-tree driver */
> > This could be given a miss. As it is less meaningful once accepted.
> 
> 
> Well, this leads to the question, what is the purpose of the 
> 'MODULE_VERSION()' macro?  If I use that, I need to populate it with a 
> value.

Don't use MODULE_VERSION.  Just because it is there doesn't mean you
need to use it.  :-)  You'll notice that none of the other spi drivers
have it.

g.
