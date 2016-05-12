Received: from mailapp01.imgtec.com ([195.59.15.196]:7772 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27028152AbcELBcRSujEE (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 12 May 2016 03:32:17 +0200
Date: Thu, 12 May 2016 02:32:00 +0100
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: Re: [PATCH] MIPS: tools: Ignore relocation tool
In-Reply-To: <1462994177-6460-1-git-send-email-f.fainelli@gmail.com>
Message-ID: <alpine.DEB.2.00.1605120218540.6794@tp.orcam.me.uk>
References: <1462994177-6460-1-git-send-email-f.fainelli@gmail.com>
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
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, matt.redfearn@imgtec.com
Message-ID: <20160512013200.3E9NWKjrted1M7-ytBy4EgakDL1nHghYPuV-K6gCXQY@z>

On Wed, 11 May 2016, Florian Fainelli wrote:

> Add a .gitignore ignoring arch/mips/boot/tools/relocs.

 It's also left behind after `make distclean' so looks like it's missing a 
clean-up rule or one hasn't been properly wired.

  Maciej
