Received: from mailapp01.imgtec.com ([195.59.15.196]:14050 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27028492AbcEUHLvnhmYS (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 21 May 2016 09:11:51 +0200
Date: Sat, 21 May 2016 08:11:35 +0100
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: Re: [PATCH 5/5] MIPS: Simplify DSP instruction encoding macros
In-Reply-To: <1463783321-24442-6-git-send-email-james.hogan@imgtec.com>
Message-ID: <alpine.DEB.2.00.1605210742260.6794@tp.orcam.me.uk>
References: <1463783321-24442-1-git-send-email-james.hogan@imgtec.com> <1463783321-24442-6-git-send-email-james.hogan@imgtec.com>
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
To: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Message-ID: <20160521071135.erCH4qw2aQtjmDzHiZPfRkvAhIq0IcctEjfZbG8vlZ0@z>

On Fri, 20 May 2016, James Hogan wrote:

> To me this makes it easier to read since it is much shorter, but it also
> ensures .insn is used, preventing objdump disassembling the microMIPS
> code as normal MIPS.

 More importantly the use of `.insn' prevents execution from going astray 
if there's a label being jumped to at the handcoded instruction.

  Maciej
