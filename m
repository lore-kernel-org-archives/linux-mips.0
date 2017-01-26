Received: from mailapp01.imgtec.com ([195.59.15.196]:20657 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993894AbdAZQRuTs4GJ (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 26 Jan 2017 17:17:50 +0100
Date: Thu, 26 Jan 2017 16:17:34 +0000
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: Re: gcc-6.3.x miscompiling code for IP27?
In-Reply-To: <addded89-4410-f818-9eb8-c1428f561795@gentoo.org>
Message-ID: <alpine.DEB.2.00.1701261612230.13564@tp.orcam.me.uk>
References: <ee417407-6877-f49c-5893-f3b3dbc2d103@gentoo.org> <44d9e9df-2d77-df23-266b-9cb90b0db4c9@gentoo.org> <1cbb8434-d7ef-36e2-1f3e-ccbb5c52ce85@gentoo.org> <62c49213-812b-a9c2-b1a6-797ecdfa2829@gentoo.org> <20170124154536.GK29015@jhogan-linux.le.imgtec.org>
 <addded89-4410-f818-9eb8-c1428f561795@gentoo.org>
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
To: Joshua Kinard <kumba@gentoo.org>
Cc: James Hogan <james.hogan@imgtec.com>, linux-mips@linux-mips.org
Message-ID: <20170126161734.CDhJARzqGbaDS9xlNZLwJdBGerNX6euqznMmSnxvcr8@z>

On Wed, 25 Jan 2017, Joshua Kinard wrote:

> Instead of making -fno-stack-check IP27-only, I can do a patch for the main
> arch/mips/Makefile instead to turn it off globally.  It looks like this option
> has been available in gcc as far back as at least 3.0.4, so would any kind of
> compatibility/version check for gcc be needed?  I'm not sure what the oldest
> gcc supported by the MIPS code currently is.

 Wrapping a compiler option into `$(call cc-option,...)' is always safe to 
do if unsure.  In this case however Documentation/Changes states 3.2 as 
the minimum GCC version so it looks to me like no such check is required.

  Maciej
