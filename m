Received: from mailapp01.imgtec.com ([195.59.15.196]:16169 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993893AbdAZOt5Vpbl7 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 26 Jan 2017 15:49:57 +0100
Date: Thu, 26 Jan 2017 14:49:40 +0000
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: Re: [PATCH] mips: vdso: Explicitly use
 -fno-asynchronous-unwind-tables
In-Reply-To: <20170126143408.2456-1-alexander.sverdlin@nokia.com>
Message-ID: <alpine.DEB.2.00.1701261445520.13564@tp.orcam.me.uk>
References: <20170126143408.2456-1-alexander.sverdlin@nokia.com>
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
To: Alexander Sverdlin <alexander.sverdlin@nokia.com>
Cc: Robert Schiele <rschiele@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, James Hogan <james.hogan@imgtec.com>, linux-mips@linux-mips.org
Message-ID: <20170126144940.Rp4suPUl7fnDyCAgMd62SVyyECVnzA88lRiWXhjuNLY@z>

On Thu, 26 Jan 2017, Alexander Sverdlin wrote:

> Not every toolchain has -fno-asynchronous-unwind-tables per default on MIPS.
> This patch specifies the necessary option explicitly for VDSO library build.

 It looks reasonable to me, but you need to wrap it into `$(call 
cc-option,...)' as older compilers didn't have this option.

  Maciej
