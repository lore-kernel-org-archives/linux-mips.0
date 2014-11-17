Received: from mailapp01.imgtec.com ([195.59.15.196]:18559 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27013851AbaKQQiY3Gofu (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 17 Nov 2014 17:38:24 +0100
Message-ID: <546A2474.3080907@imgtec.com>
Date: Mon, 17 Nov 2014 10:38:12 -0600
From: "Steven J. Hill" <Steven.Hill@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/7] MIPS: Kconfig: Enable microMIPS support for Malta
References: <alpine.DEB.1.10.1411140122420.2881@tp.orcam.me.uk> <alpine.DEB.1.10.1411152040190.2881@tp.orcam.me.uk>
In-Reply-To: <alpine.DEB.1.10.1411152040190.2881@tp.orcam.me.uk>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <Steven.Hill@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: "Maciej W. Rozycki" <macro@codesourcery.com>
Cc: linux-mips@linux-mips.org
Message-ID: <20141117163812.4M1nX46LqRax72HZSX6PqFl2w91A9Rghi7OVkjpiXaM@z>

On 11/15/2014 04:07 PM, Maciej W. Rozycki wrote:
> Add missing microMIPS support to Malta.  Currently the kernel only 
> enables support for the instruction set for the SEAD-3 board despite the 
> fact processor features have nothing to do with the board a processor is 
> installed in.
> 
For years there have been no microMIPS cores designed for the Malta
platform. Only now since you are trying to use microMIPS on QEMU is this
an issue. It was also the quick and dirty way to make sure microMIPS
kernels could not be used without changing the platform. Still, this is
certainly correct and I like it. Thanks.

Steve
