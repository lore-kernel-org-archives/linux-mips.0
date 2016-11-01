Received: from mailapp01.imgtec.com ([195.59.15.196]:58239 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993145AbcKANthE7Zxe (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 1 Nov 2016 14:49:37 +0100
Date: Tue, 1 Nov 2016 13:49:23 +0000
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: Re: System clock going slow/fast with ntpdate
In-Reply-To: <20161026085306.M18729@cdot.in>
Message-ID: <alpine.DEB.2.00.1611011343100.24498@tp.orcam.me.uk>
References: <20161026081208.M10605@cdot.in> <20161026085306.M18729@cdot.in>
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
To: Deepak Gaur <dgaur@cdot.in>
Cc: linux-mips@linux-mips.org
Message-ID: <20161101134923.Hr0qY-FO7s323MHXOvV8pZD0HDDLaS0aATSdZPzgN58@z>

On Wed, 26 Oct 2016, Deepak Gaur wrote:

> I have board with MIPS 34Kc processor and linux-2.6.29 with 
> CONFIG_HZ_250=y set in kernel configuration (i.e 250 timer interrupts 
> per 1 real second in /proc/interrupts).
[...]
> Please help me in understanding this behaviour of NTP with MIPS Linux 
> and possible fixes if any. Is it a kernel bug or a configuration issue?

 Your Linux kernel is very old, version 2.6.29 was released over 8 years 
ago.  Please try a recent kernel such as 4.8.0 instead so that you don't 
miss all the important fixes and updates.

 If you find yourself still having issues with an updated kernel, then 
please come back and we'll try to help.

  Maciej
