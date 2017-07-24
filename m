Received: from mailapp01.imgtec.com ([195.59.15.196]:9763 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992241AbdGXMva3KVDL convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 24 Jul 2017 14:51:30 +0200
From: Aleksandar Markovic <Aleksandar.Markovic@imgtec.com>
Subject: RE: [PATCH v3 08/16] MIPS: math-emu: <MAXA|MINA>.<D|S>: Fix cases
 of input values with opposite signs
Date: Mon, 24 Jul 2017 12:51:20 +0000
Message-ID: <EF5FA6C3467F85449672C3E735957B85015D9C3A3B@BADAG02.ba.imgtec.org>
References: <1500646206-2436-1-git-send-email-aleksandar.markovic@rt-rk.com>
 <1500646206-2436-9-git-send-email-aleksandar.markovic@rt-rk.com>,<20170721154201.GM6973@jhogan-linux.le.imgtec.org>
In-Reply-To: <20170721154201.GM6973@jhogan-linux.le.imgtec.org>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Return-Path: <Aleksandar.Markovic@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: James Hogan <James.Hogan@imgtec.com>, Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
Cc: "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, Miodrag Dinic <Miodrag.Dinic@imgtec.com>, Goran Ferenc <Goran.Ferenc@imgtec.com>, Douglas Leung <Douglas.Leung@imgtec.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Paul Burton <Paul.Burton@imgtec.com>, Petar Jovanovic <Petar.Jovanovic@imgtec.com>, Raghu Gandham <Raghu.Gandham@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>

> 
> ________________________________________
> From: James Hogan
> Sent: Friday, July 21, 2017 8:42 AM
> To: Aleksandar Markovic
> Cc: linux-mips@linux-mips.org; Aleksandar Markovic; Miodrag Dinic; Goran Ferenc; Douglas Leung; linux-kernel@vger.kernel.org; Paul Burton; Petar Jovanovic; Raghu Gandham; Ralf Baechle
> Subject: Re: [PATCH v3 08/16] MIPS: math-emu: <MAXA|MINA>.<D|S>: Fix cases of input values with opposite signs
> 
> On Fri, Jul 21, 2017 at 04:09:06PM +0200, Aleksandar Markovic wrote:
> > From: Aleksandar Markovic <aleksandar.markovic@imgtec.com>
> >
> > Fix the value returned by <MAXA|MINA>.<D|S>, if inputs are normal fp
> > numbers of the same absolute value, but opposite signs.
> >
> > The relevant example:
> >
> > MAXA.S fd,fs,ft:
> >   If fs contains -3, and ft contains +3, fd is going to contain +3
> >   (without this patch, it used to contain -3).
> 
> I think its worth mentioning also that for MINA.*, it returns the
> negative one when the absolute values are equal (The phrase "For equal
> absolute values, returns the smallest positive argument" in the manual
> is a bit ambiguous IMO, so I ended up checking what I6500 did).

I am going to slightly rephrase the commit messege to address this.

Regards,
Aleksandar
