Received: from bombadil.infradead.org ([18.85.46.34]:54044 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1491827Ab0KKMt6 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 11 Nov 2010 13:49:58 +0100
Date: Thu, 11 Nov 2010 07:49:52 -0500
From: Christoph Hellwig <hch@infradead.org>
Subject: Re: XFS mounting fails on MIPS
Message-ID: <20101111124952.GA11052@infradead.org>
References: <AANLkTi=mLwQ0N_cErHzES1ZWvOa8jQspeYwKgn9sU4Jm@mail.gmail.com>
 <20101104125052.GA22429@infradead.org>
 <AANLkTinqK-HvuHPeaTgxJOJuWMfomP2C12G=uVcqhWdn@mail.gmail.com>
 <20101109140527.GA13041@infradead.org>
 <AANLkTik09-0udnrpAJ-mTxMx8iKZ5UTq-ucduQJOZkws@mail.gmail.com>
 <AANLkTik=-jiE5xeJCTQZnbf7AFk7Wzap5ToBDceqsEdH@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AANLkTik=-jiE5xeJCTQZnbf7AFk7Wzap5ToBDceqsEdH@mail.gmail.com>
Return-Path: <BATV+ecf49ddc94d187cb2a78+2636+infradead.org+hch@bombadil.srs.infradead.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Ajeet Yadav <ajeet.yadav.77@gmail.com>
Cc: Christoph Hellwig <hch@infradead.org>, "xfs@oss.sgi.com" <xfs@oss.sgi.com>, linux-mips@linux-mips.org

On Thu, Nov 11, 2010 at 11:10:33AM +0530, Ajeet Yadav wrote:
> I think mips folks agree with the change. I really wish to have there
> comment.
> 
> I also wish to know do we really need fix in XFS for virtual indexed
> architecture, I think its generic issue as many architecture now use VIVT or
> VIPT caches. Do we want to say XFS is relatively unstable with virtual
> indexed architecture ?

The vmap flushing APIs I repeatedly pointed you at are the generic
solution.  They've been implement for arm, parisc and sh already, it's
just that no one has bothered to do it for mips yet.

Without the proper flushing anything that uses vmap, which includes
XFS is not "relatively unstable" but in fact not usable on systems
with virtually indexed caches.
