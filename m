Received: from mailapp01.imgtec.com ([195.59.15.196]:56546 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27008613AbbJUIE6Pl7rn (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 21 Oct 2015 10:04:58 +0200
Subject: Re: [PATCH v3] MIPS64: signal: n64 kernel bugfix of MIPS32 o32 ABI
 sigaction syscall
References: <20151019183955.6212.78229.stgit@ubuntu-yegoshin>
 <5625FCDE.9010608@imgtec.com> <56268411.1080307@imgtec.com>
From: Markos Chandras <Markos.Chandras@imgtec.com>
Message-ID: <56274723.8070208@imgtec.com>
Date: Wed, 21 Oct 2015 09:04:51 +0100
MIME-Version: 1.0
In-Reply-To: <56268411.1080307@imgtec.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-Path: <Markos.Chandras@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, linux-mips@linux-mips.org, paul.burton@imgtec.com, richard@nod.at, linux-kernel@vger.kernel.org, ralf@linux-mips.org, luto@amacapital.net, alex.smith@imgtec.com, macro@codesourcery.com, mpe@ellerman.id.au
Message-ID: <20151021080451.5-O8AzM-uolyemU0jTHcBaNSouHJvoq3pK5tH6DlQ7Y@z>

On 10/20/2015 07:12 PM, Leonid Yegoshin wrote:
> On 10/20/2015 01:35 AM, Markos Chandras wrote:
>> What tree did you use for this patch? It does not seem to apply to
>> mainline or Ralf's upstream-sfr. 
> 
> May I ask you to elaborate more and send me a concern details?
> I definitely rebased it to mips-for-linux-next of upstream-sfr from LMO.
> 
> - Leonid
> 
Ok thanks for clarifying. It does apply to today's upstream-sfr.

-- 
markos
