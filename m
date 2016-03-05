Received: from mailapp01.imgtec.com ([195.59.15.196]:8804 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27008358AbcCEBGM1dohm (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 5 Mar 2016 02:06:12 +0100
Message-ID: <56DA30FC.10603@imgtec.com>
Date: Fri, 4 Mar 2016 17:06:04 -0800
From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
MIME-Version: 1.0
Subject: Re: [4/4] MIPS: Sync icache & dcache in set_pte_at
References: <1456799879-14711-5-git-send-email-paul.burton@imgtec.com> <56D7A987.5040602@imgtec.com> <20160304103714.GA5576@NP-P-BURTON> <56D9F78E.6090303@imgtec.com>
In-Reply-To: <56D9F78E.6090303@imgtec.com>
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
To: Paul Burton <paul.burton@imgtec.com>
Cc: linux-mips@linux-mips.org, Lars Persson <lars.persson@axis.com>, "stable # v4 . 1+" <stable@vger.kernel.org>, "Steven J. Hill" <Steven.Hill@imgtec.com>, David Daney <david.daney@cavium.com>, Huacai Chen <chenhc@lemote.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Jerome Marchand <jmarchan@redhat.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20160305010604.Ao2Xm5WmW8er2Egdt1_5PBQTN4XB4CqIxPKzB5IEGiM@z>

On Sat, Mar 05, 2016 at 12:21:54AM +0000, Paul Burton wrote:

> > On Fri, Mar 04, 2016 at 07:02:24PM +0000, Lars Persson wrote:
> > > Hi
> > >
> > > Some further thoughts on the matter. You have so far not showed a
> > > valid example of a race condition. The two examples you give in the
> > > commit message are for a _single_ thread existing in the address space
> > > (fork and execve).
> >
> > Hi Lars,
> >
> > Neither fork nor exec are limited to a single thread existing in the
> > address space - I'm not sure what you're saying? fork by its very
> > definition results in 2.
>
> Ok, exec kinda is (it's late...). Still, fork clearly isn't.
Again - fork doesn't copy any user page. Copy_page_range just 
manipulates PTE tree.

So, no user page cache flushes are needed on MIPS during fork, at least now.

- Leonid.
