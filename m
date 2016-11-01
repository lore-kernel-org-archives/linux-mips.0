Received: from mailapp01.imgtec.com ([195.59.15.196]:28037 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993209AbcKAUnCsmwzk (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 1 Nov 2016 21:43:02 +0100
Date: Tue, 1 Nov 2016 20:42:43 +0000
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: Re: System clock going slow/fast with ntpdate
In-Reply-To: <2847D646-2B3F-4D6A-9312-8EFE2D3B9AF7@lysator.liu.se>
Message-ID: <alpine.DEB.2.00.1611012024350.24498@tp.orcam.me.uk>
References: <20161026081208.M10605@cdot.in> <20161026085306.M18729@cdot.in> <012925E3-E06F-413D-BBD4-9BF40F0F08A7@lysator.liu.se> <alpine.DEB.2.00.1611011900260.24498@tp.orcam.me.uk> <2847D646-2B3F-4D6A-9312-8EFE2D3B9AF7@lysator.liu.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <Maciej.Rozycki@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Markus Gothe <nietzsche@lysator.liu.se>
Cc: Deepak Gaur <dgaur@cdot.in>, linux-mips@linux-mips.org
Message-ID: <20161101204243.GpkWvGKFi5ZZUx1_VV7Tip39TElq-l73bGOjQUQ-quo@z>

On Tue, 1 Nov 2016, Markus Gothe wrote:

> I doubt that it changes spontaneously.
> 
> AFAIU this is related to NTP (the issue only shows up when setting time with ntpdate), and
> time drift is a know circumstance which must be mitigated as described by Larry Doolittle and his rate.awk-scrip.

 You mean you can compensate when suddenly 1 second of system time is only 
elapsed after 8-9 wall clock seconds?  I seriously doubt it.

 What it looks like to me is some sort of an interrupt delivery or 
reprogramming issue with the CP0 Count/Compare timer, which as you may 
recall is a one-shot event and needs rearming.  But it's not worth looking 
into with a kernel which is 8 years old.  It may well have been the time 
around which our CP0 timer suport was converted to the HPT framework and 
new code could have suffered from infancy bugs.

 Switching to another clock source might be a workaround if available with 
the system being used, e.g. the Malta board has an 8254 PIT clone in the 
south bridge wired to an interrupt line, which can be used in its periodic 
mode.  I'm not sure offhand if the PIT clock source is configured though 
in a pristine Malta kernel; it may well be that nobody cared to arrange 
that, given the arcane programming interface and the limited resolution of 
the PIT and the general availability of the CP0 timer.  And then we might 
not be talking about a Malta anyway.

  Maciej
