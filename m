Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA10037DAA6
	for <linux-mips@vger.kernel.org>; Tue, 21 Jul 2026 16:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784650510; cv=pass; b=tGENO7OgF8fR2aMfYHmp7274wpTt3CiivAJcuhM2LJ3d2ksj4/K9AIz0LcM8OjyMOUcCu0mBfuxX0zXslCGe55q4g7mI+RQwDe23o02QACNzSqWVCr99tKlHUo+lssRDL7kFOP4ny85qdBto6K2x5NqV6P+h9gtOJC1vZLmShNk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784650510; c=relaxed/simple;
	bh=0InRp8yvnqBOseUQfGY/Gg1FmgI4xIQDP2NafwpfDOw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c7fwn1pxph4897I1BSqFZeWtpGW2xwyrUvI6bxp2DC+W3lSZdN2E9mPlJ1FMLINzD6rhXByl/3YyxecpcPt8bspVWC4Gg+PUwvnvRXkgaKDK0qWhba1nh4xA+0Foojqe2hSvNCjURx8f6H2J0iUf056NQZDW7ij8eV/rGuX2Iq8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YPAauVAU; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YPAauVAU"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso89079545ad.2
        for <linux-mips@vger.kernel.org>; Tue, 21 Jul 2026 09:15:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784650508; cv=none;
        d=google.com; s=arc-20260327;
        b=ri2BSri6Z5dIc2/AxkNVIkSZkMiSRaDLzhGzFpadG1+QXnvTMRtCtrTYgu1S0wvlB6
         7Jbep6zF76HiZwtx6f3H1lrTdQDYyk5oH6L1Y9kDS6RZZpxdMbEaaHzGsqwl17f9mHHh
         Mh5aj+q/0PirfiwgR/rIS0xeaLYZsTbUcML5ZUxr20qqgtAHTHackCuV9QNj5A60ZsDc
         2mijicSx2kuZ/zd7mBMZFIev0Bf4oaCpDMQDweYwASTHpVBftiCXl2rmCsWoJOu7/qcH
         GBFZgcjNKqWKat0eWGc2RWJ7znUHMe4mVSR+gakETDW3RiyGMLvhrvsKFDWqPQlqrf1Q
         CsZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IgNXR6G7FgCbu0VjOkM5rLom6H5zjJdGl0GKEVlbeWk=;
        fh=32i94nqQKksGHDVU4DejV9/3KBaFOC1pbtwy+a9VMSM=;
        b=gHRf9w67OSb2FF+HqtY8DklKMIUNLBugex5nlJ5rdjdd8Eml8VTfSKZJTC62ivJ83t
         draoM5i2fJitKQYm5JzeaEK8Hj7bpZYdDXlIkk8uStuoOsnPyvp1pFZLxb4CG3AuKrCG
         MAjA3osBbcOpjExDVh+y0DykZu64JCmnI5SUvjSxfJtVehIk8SNCjeLM6IO8TPzFK3kf
         xzFdixPOQjVypClK3QfKEYRygosv6I3aLm26LiHz4oXMLbC3vM4aBpJ2qLdkYae8UEQp
         xz8ad7Bl/Qgka8J0ION3dE9ne50yohCEr+zn8QKfRAxDZYI/OOPfWup/8T96NQJpqt86
         FLDw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784650508; x=1785255308; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IgNXR6G7FgCbu0VjOkM5rLom6H5zjJdGl0GKEVlbeWk=;
        b=YPAauVAU0Uo+Yi6+TbXsDpO0loTn9MWqTJDEsyuMbW/6tEfraOqvV7D3tTDuphCx0q
         KoN5YwFF3HZhokq2VeptYJNNDBLNBFOOoh25TMtiGLK1MkjdjxG4p1dM/1Cccu+k3IQU
         kIaRq5zH8lTuLa4+89Fc4d108RshWJkhzLl88hR1yP6mTNGQEk4/DU5THDF6stpeeHfz
         BtsyITG5j4kwrqainAGSQ6zo3Y2I75Pm66pO62ugyhA8lv7TyevPWgbaub6z3d19dOM2
         bQoMiGoRj9NXEKckDlE46tbK2mKzq4Jx8BVlbDyTw4vSJjtaDepIbv4PBAGu1D6ub2oT
         74LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784650508; x=1785255308;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IgNXR6G7FgCbu0VjOkM5rLom6H5zjJdGl0GKEVlbeWk=;
        b=Ranh0mA6h24K3rr1tIPOG1rROiYt3PHlaW+0Iww2FbjhBwx32cHpqTKpNZYNHvlPgA
         hGkVkZFqf44tfPBYyU7MT/KpFqI21qrDIEVHN/cgeRmUcORW0D8GIIanhbDInay7477v
         hM/M290KhYG+K79yb4IoL2NdJjLN5qULLX9KSoUGnaKeqeSWncsOv0lciuX7yUPkHjUM
         vl26sobXEUk9IlD4psb5T1RqPDbiGA4T9pg/XpiWh1W+p0dZKdkSEk03u4vja8t49hxe
         fpGc0JMdEskLOSFmL26PAh2UKXwxjhcwmMpR5ViJxzDRYifQ8c5aBXZl6Fz3R52yQegZ
         98iQ==
X-Forwarded-Encrypted: i=1; AHgh+RpZ7vdWR7GZD1HrW6WH5N0/zv1t21nGhcof5gsv0LzqrEz3aI2jZDF8lcNx3GqIge8azPjHSWVLXCZl@vger.kernel.org
X-Gm-Message-State: AOJu0Yzmuwduj2Nj2Bms1WHnxWCi5LxLvUBabglYbZwjcDJATWkRq6XT
	TUo7WQcyyIWFrx4UBqXvGl+/hgIDd/7x7ZGry8hEJGEpUvXX9TuuVGc3NSZAUTibt3M4rTrbf1z
	SfwvKvZ1gZzNmWxcY0gdNpl2hMKdl5Hg=
X-Gm-Gg: AR+sD134UYQL2B+5xEx9pgtS4+xUapLMhxSDewWa1stYgL7zrsqGwg2SbE2Q/+js7ni
	pSCa88JnilV7fOXPOD9eM0ixYA5nvjggaIRoVqEaQqKPeO5EHu3rTNAGC83M636qU5u+/N2TSKQ
	3MX5edJgR802LewFAXoj1NJP1ISPiZpaEXxIFDx5Uv7yKZkzCwh/KGPQaJhsGavaj3/QVNJk/Mn
	GYoPgKD/ydS0c13qdfe63CDOkHt/WY/Dd9MScrgfccAw+fkUWPu0cQqq/rVUHj85rQB6FSJ82ar
	z7cZiGjkszVhDWljdKc=
X-Received: by 2002:a17:903:3b85:b0:2cc:777f:d67c with SMTP id
 d9443c01a7336-2cf3488b0d2mr200606075ad.13.1784650508072; Tue, 21 Jul 2026
 09:15:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260720142538.2766-1-mahad.ibrahim.dev@gmail.com> <CAJhJPsVj=pntghpDvzwcNj4hm-7Uu0bD+Uy-4b3Okw5Sq__JQw@mail.gmail.com>
In-Reply-To: <CAJhJPsVj=pntghpDvzwcNj4hm-7Uu0bD+Uy-4b3Okw5Sq__JQw@mail.gmail.com>
From: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
Date: Tue, 21 Jul 2026 21:14:55 +0500
X-Gm-Features: AUfX_mw_f7fhOlKyg76JQf_H1QYuX81oqzcFrWW8btfyHfWvpPtDACpY59Lwjv4
Message-ID: <CAHpOaLADzSJqSF6=oue2gwrszNAv_mv_XTG2GM5J8Np-+i+Edw@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: loongson1-apb-dma: fix residue calculation for
 queued descriptors
To: Keguang Zhang <keguang.zhang@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, linux-mips@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Keguang,

Thank you for the quick response and feedback. I'll adopt the single-loop
structure.

Additionally, Sashiko pointed out another possible flaw, which occurs when
the hardware is idle. The hw[LS1X_DMADESC_NEXT] of the last terminator LLI
in a chain is 0 and the current next_phys the hardware returns with

    next_phys =3D chan->curr_lli->hw[LS1X_DMADESC_NEXT];

is also 0. Which would match, however I do not think it's the preferred
behavior, the residue would only be the length of the last LLI. If
you wish I can add it as an additional patch on top of the single-loop
structure.

Best regards,

Mahad Ibrahim

On Tue, Jul 21, 2026 at 12:32=E2=80=AFPM Keguang Zhang <keguang.zhang@gmail=
.com> wrote:
>
> Hi Mahad,
>
> Thanks for catching this use-after-iterator issue.
>
> On Mon, Jul 20, 2026 at 10:25=E2=80=AFPM Mahad Ibrahim
> <mahad.ibrahim.dev@gmail.com> wrote:
> >
> > ls1x_dma_tx_status() locates the descriptor actively being processed by
> > walking the LLI list and comparing the hardware reported next descripto=
r
> > pointer against each element's next-descriptor pointer.
> >
> > A list_for_each_entry macro is used in the comparison phase, which
> > internally expands to the container_of macro to find the current
> > ls1x_dma_lli's next-descriptor pointer to compare against. However a
> > problem occurs when the loop reaches the final lli list element and wra=
ps
> > around to the head. The head is a different struct ls1x_dma_desc. It go=
es
> > down to the offset the node member would be at in ls1x_dma_lli inside o=
f
> > ls1x_dma_desc.
> >
> > This leaves the lli pointer somewhere inside of ls1x_dma_desc at the en=
d
> > of the loop. The subsequent phys debug value read therefore would print
> > garbage as a valid phys address.
> >
> > The primary bug occurs in the residue calculation list_for_each_entry_f=
rom
> > macro. The lli pointer still points to somewhere inside of ls1x_dma_des=
c,
> > when the list_for_each_entry_from performs the same wrong offset
> > calculation on ls1x_dma_desc to determine the stop condition of the loo=
p,
> > it lands at the same offset that lli pointer is on, and the loop
> > immediately stops.
> >
> > This produces a 0 residue value, while it should be the entire length o=
f
> > the lli list chain. The driver advertises DMA_RESIDUE_GRANULARITY_SEGME=
NT,
> > so a 0 residue would mean the transfer has completed.
> >
> > Found by the following Coccinelle check:
> >
> >   scripts/coccinelle/iterators/use_after_iter.cocci
> >
> >   drivers/dma/loongson/loongson1-apb-dma.c:461:6-9: ERROR: invalid
> >   reference to the index variable of the iterator on line 450
> >
> > Note the check still reports this line after the fix; the remaining use
> > is safe (the cursor is only dereferenced on the match path, or reset to
> > the first entry otherwise).
> >
> > I did not see a bug upstream detailing this error, nor do I have the
> > hardware to confirm this bug or error, all this is from a pure code
> > examination.
> >
> > As I do not possess the hardware, I cannot test the patch. Compile test=
ed
> > only with mips64-linux-gnu-gcc.
> >
> > Signed-off-by: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
> > ---
> >  drivers/dma/loongson/loongson1-apb-dma.c | 15 +++++++++++----
> >  1 file changed, 11 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/dma/loongson/loongson1-apb-dma.c b/drivers/dma/loo=
ngson/loongson1-apb-dma.c
> > index 89786cbd20ab..8bb6e6e5719d 100644
> > --- a/drivers/dma/loongson/loongson1-apb-dma.c
> > +++ b/drivers/dma/loongson/loongson1-apb-dma.c
> > @@ -439,6 +439,7 @@ static enum dma_status ls1x_dma_tx_status(struct dm=
a_chan *dchan,
> >                         struct ls1x_dma_desc *desc =3D to_ls1x_dma_desc=
(vd);
> >                         struct ls1x_dma_lli *lli;
> >                         dma_addr_t next_phys;
> > +                       bool found =3D false;
> >
> >                         /* get the current lli */
> >                         if (ls1x_dma_query(chan, &chan->curr_lli->phys)=
)
> > @@ -447,11 +448,17 @@ static enum dma_status ls1x_dma_tx_status(struct =
dma_chan *dchan,
> >                         /* locate the current lli */
> >                         next_phys =3D chan->curr_lli->hw[LS1X_DMADESC_N=
EXT];
> >                         list_for_each_entry(lli, &desc->lli_list, node)
> > -                               if (lli->hw[LS1X_DMADESC_NEXT] =3D=3D n=
ext_phys)
> > +                               if (lli->hw[LS1X_DMADESC_NEXT] =3D=3D n=
ext_phys) {
> > +                                       found =3D true;
> >                                         break;
> > -
> > -                       dev_dbg(chan2dev(dchan), "current lli_phys=3D%p=
ad",
> > -                               &lli->phys);
> > +                               }
> > +
> > +                       if (!found)
> > +                               lli =3D list_first_entry(&desc->lli_lis=
t,
> > +                                                      struct ls1x_dma_=
lli, node);
>
> However, I don't think falling back to list_first_entry() when no
> match is found is appropriate. Since next_phys should always match one
> of the LLIs in the descriptor chain, failing to find a match should be
> treated as an unexpected condition rather than silently falling back
> to the first LLI.
> I would suggest something like:
>
>        scoped_guard(spinlock_irqsave, &chan->vc.lock) {
>                vd =3D vchan_find_desc(&chan->vc, cookie);
>                if (vd) {
>                        struct ls1x_dma_desc *desc =3D to_ls1x_dma_desc(vd=
);
>                        struct ls1x_dma_lli *lli;
>                        dma_addr_t next_phys;
>
>                        /* get the current lli */
>                        if (ls1x_dma_query(chan, &chan->curr_lli->phys))
>                                return status;
>
>                        /* locate the current lli */
>                        next_phys =3D chan->curr_lli->hw[LS1X_DMADESC_NEXT=
];
>                        list_for_each_entry(lli, &desc->lli_list, node) {
>                                if (lli->hw[LS1X_DMADESC_NEXT] !=3D next_p=
hys)
>                                        continue;
>
>                                dev_dbg(chan2dev(dchan), "current
> lli_phys=3D%pad\n", &lli->phys);
>
>                                /* count the residues */
>                                list_for_each_entry_from(lli,
> &desc->lli_list, node)
>                                        bytes +=3D
> lli->hw[LS1X_DMADESC_LENGTH] * chan->bus_width;
>
>                                dma_set_residue(state, bytes);
>                                return status;
>                        }
>
>                        dev_warn(chan2dev(dchan), "unable to locate
> current LLI\n");
>                }
>        }
>
>        return status;
>
> > +                       else
> > +                               dev_dbg(chan2dev(dchan), "current lli_p=
hys=3D%pad",
> > +                                       &lli->phys);
> >
> >                         /* count the residues */
> >                         list_for_each_entry_from(lli, &desc->lli_list, =
node)
> > --
> > 2.54.0
> >
>
>
> --
> Best regards,
>
> Keguang Zhang
