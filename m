Received: from mailapp01.imgtec.com ([195.59.15.196]:45931 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010960AbbHDUrSsUfYi (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 4 Aug 2015 22:47:18 +0200
Message-ID: <55C124CE.3070209@imgtec.com>
Date: Tue, 4 Aug 2015 13:47:10 -0700
From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
MIME-Version: 1.0
Subject: Re: MIPS: Make set_pte() SMP safe.
References: <1438649323-1082-1-git-send-email-ddaney.cavm@gmail.com> <55C10F4B.2050003@imgtec.com> <55C11A37.5070509@caviumnetworks.com> <55C1214F.8050208@imgtec.com> <55C12263.7070407@imgtec.com> <55C122D7.3040803@caviumnetworks.com>
In-Reply-To: <55C122D7.3040803@caviumnetworks.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <Leonid.Yegoshin@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: David Daney <ddaney@caviumnetworks.com>
Cc: David Daney <ddaney.cavm@gmail.com>, linux-mips@linux-mips.org, ralf@linux-mips.org, David Daney <david.daney@cavium.com>, stable@vger.kernel.org
Message-ID: <20150804204710.4pnB6WClGVMxapuhYPN19I1v6A-yXc4Cxs0AKPrlaBY@z>

On 08/04/2015 01:38 PM, David Daney wrote:
> I don't know what the purpose of guard pages is.  I thought it was to 
> produce an OOPs message if you accessed just beyond the end of the 
> vmap area.  If people are using them for some other reason, then I am 
> not aware of it.
>
>
Right, but if you have a buddy problem then it means that in your case 
the guard page IS USED... and doesn't produce OOPs.
