Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794314556;
	b=WqybyiLQu4vczMiRLOOCDG0FPS8ruV410STX7SzeOLyXtrCNfW+aCmStifsHxe60fp5b
	 DjqBq9R3+fpD0jRdBjtOOdPUuXLpoNXVLroCSxjWVYJcFg6cyYZuTKg8nhFzR0rJLn599
	 YO8AZgeUwx+dm56nRXcJpnGSJ6GPwGWI+KwzWi5HwsZdPoi1C7GaPdZcu9sdfwoFsYx0q
	 tdeBc+FPIi7nqgfCE9w9t4agMtpHDjXf8yN071hcDnRhy4lpwDtO/i4GDnKoP530UPLJa
	 SDY/nQcDaabeZOGLehPTx8f9E+CecQcjZC3pSEmkA8dBOcRsWyyyD+bt6xHBE4MWUVQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794314556;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=10UT92sr+vRIVo9wGLbCQyuS9MFs0Bc9LyaIXMh/H9I=;
	b=XZam8bNFOrziWSXq/+Wpd11g1A/jKaQudAO3X4b1KxLJJxL8LYzIWHR2Dc/lc2Ujr8f3
	 uvaq0PPDNMnPa7AY5FOhIkfEf8n4p11c7Mv5hB+5EGuAqnxdjGgd/m0TIe5P+sCnJOSvH
	 hJ8OM6Ig0XnV3q/AlkTdgo80dX3eGjoosCTBbcEe9AcrZri/ySDsD5mqMl55dmLHOBZsN
	 jpvPGl1fMbyxd6Dhdr1Xci8nikIMHkcGPpKGTEUZwXaDlvherm0aqQjNs2XdvFq4hcRPV
	 mQ280ZA93nxDYHSj7Armi1kRJNqqMaN+UrPq9nVX+lp/SQpWQAtgbp3XKbtLOvSG/ZA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o8HjuQ88;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625D060A260D
	for <linux-mips@vger.kernel.org>; Tue, 10 Nov 2026 12:42:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 625D060A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o8HjuQ88
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-91ec2d42231so21108866d6.2
        for <linux-mips@vger.kernel.org>; Tue, 10 Nov 2026 04:42:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794314555; cv=none;
        d=google.com; s=arc-20260327;
        b=B3udWtOstdl4pySdLzFfyj/RcdwtPpISe0fGvR/pCKVd3l2BWW9WL95LL0OsU2h7c8
         W366xW3Jck3F2Or4z8BAEorG6ohmMVia3t/v0Xaei7TXVKJQAPXc6hg+g07kNp1i0Crl
         jpu9D9zkkWJUlTYTu7I8dJHrIQcRPOsYcwtSuTRfHIdh0Y2B1Pt4iBfDlS3qHOy+wCo9
         dbpZsr4vZea93zKdyvCl/NZh0ylAxdJDk64oNwH9+HgXeIzEwhYb8ag7kVKc82/dVuuZ
         iUFy3KV2xPiyafuYZOw6zNTN4zPZOqVOUQ/6KNxGaUKWdr+PyKge+Zfgwo3tDYabvXKG
         ca8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=10UT92sr+vRIVo9wGLbCQyuS9MFs0Bc9LyaIXMh/H9I=;
        fh=HoOc6DkcT3KLkbP+SVKkVjmWUMceasByiL/c1CxkKwQ=;
        b=Q1V1xI6YKhZnX1xJwEP+sa0Wd87AfyZsdjcdH+EYF5tCUYJsrmBtRhq0rVY/xrIpBm
         rDZAT7zZkjAcv9IwN47RtLcHUfT4BIIOadPYDFsz2TpBFxDmRqQCFB8h1SsBITyZko8z
         MrcCS/VkystpV3VIWqosWn3+AzWhxfqgbjycDRCiat3OD4Yh24O1qvb7F/jrJyjtufPO
         HMWIcRsLN3zZdxVHh5EMJyg3n/kDqoYv4xpUiv1JS3CtfCc3+Dzf5hxRtjPWRC+3ntFV
         FV0M750O4bx34Lt9D2nGW4X8qx38xknKsJ3I9lFylVCjxiRwHB5HqVYbER18LRUB83W8
         jirw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794314555; x=1794919355; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=10UT92sr+vRIVo9wGLbCQyuS9MFs0Bc9LyaIXMh/H9I=;
        b=o8HjuQ88fkTW5d1ZW/m8UUP7qUQpPD8kCVKzDtrOtYt3cOxdEj1WVqdHEHMv5/FY+0
         DQZbxgAWWXsAWPjlCqC/S73i5mccSSmnTpemGu80vpL9URa8Yc/U3g8r0rfWpG8dzxlf
         FnKNqE1XK2Ni8s7Taui8GPF6fvxIwIWzA67a5fBPaLlv+Fv+39UMgWlMXBY7lJA+dCCb
         or+YMvYajbh7ypqWpXF04JApiwgmR7iBnsmTnFu79RRd5RtfY6sx8ZWmVo+/Z/78vnKn
         LB5Y2DLceN+KGTHLkJi7gssFQ9MZcUWdJRyEQcIRDdl1BnTSuTjcXT7Npcrqn8AVQha4
         LfQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794314555; x=1794919355;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=10UT92sr+vRIVo9wGLbCQyuS9MFs0Bc9LyaIXMh/H9I=;
        b=04VzKc3JWVTsQtA4Oc6Tqa3oa40yTJJpJZwjTq7UXWYdKGWo1EYD8kPgd+PlcQGmgj
         1uOwBUATHYzIUmWXTr20xzaWd5yBvHvWybl1FHQqVZ4oKgRcQXyD6f/6WUoe3Gabaaza
         Lr/PjCAbbPXtSaA3AfL1y3CMe60GqqlwVMsXYfNc/iVPXPMTioVYly6RLMhM8BLvdGKb
         NkW/SCPLIbBz455L17kln59tRTvBTDlnPlw8/H6D77rIXHGi+XmonMLLA26NLO17Nk0Z
         bO0FkCiidtx9IgdRkTsuKxI70XuJkAN9w4oKqIrMZBnMIY9NPCyPjAiURxGXvTW3MtSH
         71/A==
X-Gm-Message-State: APuU4Z+r90ZlUGrzVjzN6N36JdncpEqRdq1Uz/ToEDGKIVNUCUi4rJBL
	hHta8dvTrQHnfzoh9BNWrhq8PiJEXjgTqfRCi42AyEOU9jQ7BmAYdhyzL+s6QDN2fTAqykMjQA3
	0UPgVMZ4Gq/M0xUyMMIG6n+UuOHjAIIY=
X-Gm-Gg: AYBFou2Q72xahS5rQj3Twl3Rt6Doevo147WEOUa99rVr3fgUggz8R1Sgk/Ged9zI98f
	0a70YQTm6ScLjBJ2ftmJl0eYy96aioO/QkVRSCX6dnWPX628zTeSw89A1DGmfNGJewEALKD1RkB
	0Xo/6wBSijA74lkOi+/YO0I02uH/SIdxzmNR3LN03KxBNWNXQjXOf8qi6XZPXqLTHxiAb20v8Db
	n7K2Pf7vEI+Cp3mqSTkzFlWLDngo/g8q9bESGT5/UWD09XbAq3vz6pEYTr39VcE8GebMGyCQDys
	7LODqSw1QW+eH2uyy9t/TMveUrxyVX8XLNr/v0JSN4C9TUtwX5JrNJhYlOubOlKUCdrBo3o6/+k
	66A/jwT9ZCPfWei1l//9AXiV5KFyv5G7uxJCg1J1o0srdvbBxhV/vEk+w4yOGXHjFzeXWNzJ22k
	XHZBiHfzJ3OONm/ZuY4nvq
X-Received: by 2002:a05:620a:461f:b0:93e:c12c:f137 with SMTP id
 af79cd13be357-9479f368c54mr360445785a.82.1794314555301; Tue, 10 Nov 2026
 04:42:35 -0800 (PST)
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CGME20261110094848eucas1p2577d7a3c60643a040e599dfa1bf97f08@eucas1p2.samsung.com>
 <20261110094830.2081847-1-m.szyprowski@samsung.com> <20261110094830.2081847-3-m.szyprowski@samsung.com>
In-Reply-To: <20261110094830.2081847-3-m.szyprowski@samsung.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 10 Nov 2026 04:42:23 -0800
X-Gm-Features: AclHuK-FeNynpA1_RJvncVNma0nOMx7dW4op-Ljg-ln5a78S2ORxIIsRcrITnr8
Message-ID: <CAMo8BfKENmH3rZU5jyCdVOBzRAQ+KBJmVyjEWG97XYxBNaZ=qQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] xtensa: handle highmem pages in arch_dma_prep_coherent()
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@infradead.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, Chris Zankel <chris@zankel.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 1:48=E2=80=AFAM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> arch_dma_prep_coherent() performs the cache maintenance on the address
> returned by page_address(). xtensa with CONFIG_HIGHMEM uses
> HASHED_PAGE_VIRTUAL, so page_address() returns NULL for a highmem page
> that is not kmapped, and the cache operation then works on the virtual
> range starting at 0 instead of the buffer, leaving any dirty cache lines
> of the buffer in place.
>
> Highmem pages do reach this function: dma_alloc_contiguous() can return
> a highmem CMA page, which dma_direct_alloc() handles by forcing the remap
> path and calling arch_dma_prep_coherent() on that page before creating
> the uncached mapping.
>
> Fix this by reusing do_cache_op(), which the arch_sync_dma_for_*() hooks
> already use and which maps highmem pages one page at a time with
> kmap_atomic(). For lowmem pages it does a single cache operation over
> the whole range, so the behaviour is unchanged there. A small wrapper
> is needed because __flush_invalidate_dcache_range() is a macro on cores
> with a write-through data cache.
>
> Fixes: 0f665b9e2a6d ("xtensa: use the generic uncached segment support")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/xtensa/kernel/pci-dma.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>

--=20
Thanks.
-- Max
