Received: from mailapp01.imgtec.com ([195.59.15.196]:1679 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010992AbbARVsIWh0Pn (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sun, 18 Jan 2015 22:48:08 +0100
Date: Sun, 18 Jan 2015 13:47:57 -0800
From: Paul Burton <paul.burton@imgtec.com>
Subject: Re: [PATCH] MIPS,prctl: add PR_[GS]ET_FP_MODE prctl options for MIPS
Message-ID: <20150118214757.GU28594@NP-P-BURTON>
References: <1420719457-690-1-git-send-email-paul.burton@imgtec.com>
 <54B519B6.5040604@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <54B519B6.5040604@imgtec.com>
Return-Path: <Paul.Burton@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Markos Chandras <Markos.Chandras@imgtec.com>
Cc: linux-mips@linux-mips.org, Matthew Fortune <matthew.fortune@imgtec.com>, LKML <linux-kernel@vger.kernel.org>, linux-api@vger.kernel.org
Message-ID: <20150118214757.kvdlYTsBmDMTe68LkztNAUbBUCD_Y-wQ8rKB9upGVf0@z>

On Tue, Jan 13, 2015 at 01:12:22PM +0000, Markos Chandras wrote:
> Hi,
> 
> I think the "MIPS,prctl" in the title should be "MIPS: prctl"

I used the comma to denote a list - that is, this change affects both
MIPS & the generic prctl code. To me your "MIPS: prctl" suggestion would
indicate that the changes are confined to arch/mips.

> I have also CC'd the LKML and the linux-api mailing lists since this
> touches the kernel ABI with the new PR_[GS]ET_FP_MODE definitions.

Thanks,
    Paul
