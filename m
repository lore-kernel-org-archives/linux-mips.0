Received: from mailapp01.imgtec.com ([195.59.15.196]:41516 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992241AbdGXMtbFU2vL convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 24 Jul 2017 14:49:31 +0200
From: Aleksandar Markovic <Aleksandar.Markovic@imgtec.com>
Subject: RE: [PATCH v3 12/16] MIPS: math-emu: <MADDF|MSUBF>.<D|S>: Fix some
 cases of infinite inputs
Date: Mon, 24 Jul 2017 12:49:20 +0000
Message-ID: <EF5FA6C3467F85449672C3E735957B85015D9C3A2C@BADAG02.ba.imgtec.org>
References: <1500646206-2436-1-git-send-email-aleksandar.markovic@rt-rk.com>
 <1500646206-2436-13-git-send-email-aleksandar.markovic@rt-rk.com>,<20170724103914.GQ6973@jhogan-linux.le.imgtec.org>
In-Reply-To: <20170724103914.GQ6973@jhogan-linux.le.imgtec.org>
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
Cc: "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, Douglas Leung <Douglas.Leung@imgtec.com>, Miodrag Dinic <Miodrag.Dinic@imgtec.com>, Goran Ferenc <Goran.Ferenc@imgtec.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Paul Burton <Paul.Burton@imgtec.com>, Petar Jovanovic <Petar.Jovanovic@imgtec.com>, Raghu Gandham <Raghu.Gandham@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>

> 
> ________________________________________
> From: James Hogan
> Sent: Monday, July 24, 2017 3:39 AM
> To: Aleksandar Markovic
> Cc: linux-mips@linux-mips.org; Aleksandar Markovic; Douglas Leung; Miodrag Dinic; Goran Ferenc; linux-kernel@vger.kernel.org; Paul Burton; Petar Jovanovic; Raghu Gandham; Ralf > Baechle
> Subject: Re: [PATCH v3 12/16] MIPS: math-emu: <MADDF|MSUBF>.<D|S>: Fix some cases of infinite inputs
> 
> On Fri, Jul 21, 2017 at 04:09:10PM +0200, Aleksandar Markovic wrote:
> > From: Aleksandar Markovic <aleksandar.markovic@imgtec.com>
> >
> > Fix the cases of <MADDF|MSUBF>.<D|S> when any of two multiplicands is
> > infinity. The correct behavior in such cases is affected by the nature
> > of third input. Cases of addition of infinities with opposite signs
> > and subtraction of infinities with same signs may arise and must be
> > handles separately. Also, the value od flags argument (that determines
> 
> s/handles/handled/?
> s/od/of/

In v4, I am going to fix these typos and also other typos and spelling mistakes
in commit messages of all patches in this series.

Thanks,
Aleksandar
