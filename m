Received: from mailapp01.imgtec.com ([195.59.15.196]:34276 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992400AbdHJIrBlaiGA (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 10 Aug 2017 10:47:01 +0200
Date: Thu, 10 Aug 2017 09:46:44 +0100
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: Re: [PATCH v2 5/5] MIPS: Allow floating point support to be
 disabled
In-Reply-To: <20170807094132.GA23183@linux-mips.org>
Message-ID: <alpine.DEB.2.00.1708100146580.17596@tp.orcam.me.uk>
References: <alpine.DEB.2.00.1706162029030.23046@tp.orcam.me.uk> <20170616202120.18435-1-paul.burton@imgtec.com> <20170807094132.GA23183@linux-mips.org>
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
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paul.burton@imgtec.com>, linux-mips@linux-mips.org
Message-ID: <20170810084644.kp_kjIaCMG56UNb1XqxMgo-NFd9M9dHpfn7OSxDH3X0@z>

On Mon, 7 Aug 2017, Ralf Baechle wrote:

> Or we simply make the kernel panic when it detects an FPU but has no
> FPU support?

 Why would we want to make the kernel panic in the presence of an optional 
unused hardware component?

 Paul's proposal looks reasonable to me.  If people want to throw away FPU 
support to save on memory, then let them do that.  Just make that depend 
on EMBEDDED or suchlike, so that it's not a decision taken lightly.

  Maciej
