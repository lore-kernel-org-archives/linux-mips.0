Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693C251A12A
	for <linux-mips@vger.kernel.org>; Tue, 29 Sep 2026 14:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790691130; cv=none; b=mOyEISKDJm7ToWHxccVDVMV7HMfaJDKc0w2CxshKxzB2IoZATFDl3oL68oACxafM4+9tanxDosRbopNb/996/BpVsRpwLZiHQkZETkGVtNnJzVrtAQtC33caUbHbUeI9CCYWe0aGPlJ0CDpTHVweEIHP2Y0udZCJjFuQmHYIA7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790691130; c=relaxed/simple;
	bh=GeatX/mSgt8EYGKrJweaQ6M1vHW/l+J78fDDVRnanZo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=d0zhQJfA8QHhaYTrh9XwC/mehlNNV6qrkcbpM5IL62PlRBHiiJEZ85E2JtE25TP1Gqdj0tCxJEqVceW3eLF8URBVGmsmIWyqmZv+3Ks3hzJpZu0AFONV7H0JvX4i3tFMP+3POzqqF1gPK+Ixzfpuc77GjBFeLUwxvQmv2x/OveE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Fw+Bf7gu; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=YkfMBEbQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Fw+Bf7gu";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="YkfMBEbQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790691128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2p0mpabVoWXtlpkN0tOfNpGONGhlkPF/zvbxue/ki/k=;
	b=Fw+Bf7guA/8CkttiPD1yr463Ph+4tyrM+ge0Bhwj2/c9Q7xhqgCveHlheM6CxKOGSJ/Fd0
	cDjnK3M3TwzFZfRcxE+4vr0XYOIiNfcmYBPkwfh23vBCuEZhbAtnGxa9hfuP/2rr4nKLEK
	iBMK8xtW5/G3zlyHPthQKg64FcKaG6Y=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-280-EG6vtKSoOz2HO2p0ya3UGg-1; Tue, 29 Sep 2026 10:12:05 -0400
X-MC-Unique: EG6vtKSoOz2HO2p0ya3UGg-1
X-Mimecast-MFC-AGG-ID: EG6vtKSoOz2HO2p0ya3UGg_1790691124
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a0037a1c05so21559225e9.2
        for <linux-mips@vger.kernel.org>; Tue, 29 Sep 2026 07:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790691124; x=1791295924; darn=vger.kernel.org;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2p0mpabVoWXtlpkN0tOfNpGONGhlkPF/zvbxue/ki/k=;
        b=YkfMBEbQrf6BdVVZ4feI8A8i1jiQcRaDPObyAwKTaohvmnqhJuEGI4l5b6hCIc8kI0
         fSZwUG9pt6ZWozcGsMRzp3miSNlImyiNI+Hr90r2i5+OhZStUw2ZDyw3RFbsjAGknsFn
         08YpOn6FkgE/SVxDbnfMHCNJpvK13LBq0mGx3jK1ZJ8Nm4QeVw4nEa/1QEaIcrfz82kq
         ayPmfulXTMcCEyeLVTx5FY4ubhrIxFFFpivchcIlWf4pAc5dODTppJUq8Kl+THtUNjBb
         hFyLei3EekM/SiWPqZO/SS/eJD3T71TOA7Q2m4fMKY0DezU6XBzImdwOdCDfwaiQUJHJ
         VXng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790691124; x=1791295924;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2p0mpabVoWXtlpkN0tOfNpGONGhlkPF/zvbxue/ki/k=;
        b=0aufioOs0MdnuS5lXyTTuNxV9T+a1UAYXSNEZ1ZWLxxfSe1aVgBw53EZewXZeIBi4y
         9buXavP7tc/IN3ujNKCbBrEU4bfbZRZeEYqQzcpZB+BCLUJUXvSDQDrpoeZ4XmnZKACp
         /6moXHpdplPF8yFjZff5TQWkuyPMBZ9Fa8W03zojjVqayfyhAKBsg0joijW9mXae6U+p
         SfuUiMbYWa/KKNzF4yjvd1ZEjP2mirEpsAuueDrULSiMN9g+Zh9aPOLmd0YYnd8cvtCy
         i4CatONJw/9uwhWBQsVDkSsHBOWFw9P3SjrzylVniE46YRhYjtrNENslPH/yFbyYQSb1
         LSAw==
X-Forwarded-Encrypted: i=1; AKwUvBzk1a/b9fzW+ek96OhlOOv+nLYCtYvSPkHenPcesvPve7ek6gEEI4SLUJ3EFHMVzRYFXOr5DSgdyWHk@vger.kernel.org
X-Gm-Message-State: AFuF++n7+rp92YtQxz1fRbZphYqYS6ZPSOCfrg7sZPmzCOGlUuc7RFct
	SUbir4GskOF+z/R9qmWn7BhPU/ej/ZwcR7NfbIOfKchgBCpj+3dXALfsFyhlHsW5J8taQjAgVIK
	XzZxifU8heI+MgIpztsVIacFu4uDcSmH45Yf0JKau25QGt8G7TqOyWh9vmlA2fVo=
X-Gm-Gg: AYBFou00v4yAd9SOLos50jzdkqdIE58F6GyknFoiL2ezLLsrfMJpcET/rrP+ttHGbvp
	ZWOhnsrE/YyjP74gKYfp346KWpT54jy9l2uR2X4dkz90iwugPq7FKbNhSghGi6c8CzxghlbJv5e
	XhtbIcNjNiXGxhxZ55pd1aufXC4uqh28Sv3wW0xiKxpnum2FXaxJxcnoywTJurSnrN4nOOnFuXK
	ueoQu9u1KMsPmSeWl6JnMPlGckEcchifwWiBicz+USOOEHtc1fAql8lw59dyjcrB8yQkz/ieWnw
	YbFTqsTrIG9n4dhyosG/GV1te8lP6H9zW6iEfI1gva2370Fk9lV8zCUzN4aGJuXFUGvvc+lvNav
	xJ0khtuOJHLtKv16p/GPQxd/OoKzfPyk=
X-Received: by 2002:a05:600c:46cc:b0:4a0:857:a3a5 with SMTP id 5b1f17b1804b1-4a00857a46amr82578745e9.16.1790691123725;
        Tue, 29 Sep 2026 07:12:03 -0700 (PDT)
X-Received: by 2002:a05:600c:46cc:b0:4a0:857:a3a5 with SMTP id 5b1f17b1804b1-4a00857a46amr82578175e9.16.1790691123350;
        Tue, 29 Sep 2026 07:12:03 -0700 (PDT)
Received: from aconole-thinkpadt14gen4.rmtusnh.csb ([24.151.142.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a013c64fecsm6760665e9.0.2026.09.29.07.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 07:12:01 -0700 (PDT)
From: Aaron Conole <aconole@redhat.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net,  netdev@vger.kernel.org,  edumazet@google.com,
  pabeni@redhat.com,  andrew+netdev@lunn.ch,  horms@kernel.org,
  kernel@xen0n.name,  chenhuacai@kernel.org,  tsbogend@alpha.franken.de,
  deller@gmx.de,  razor@blackwall.org,  idosch@nvidia.com,
  ardb@kernel.org,  tim.bird@sony.com,  loongarch@lists.linux.dev,
  linux-mips@vger.kernel.org,  linux-parisc@vger.kernel.org
Subject: Re: [PATCH net-next 3/3] net: drop unused LLC-related includes
In-Reply-To: <20260928190800.2521749-4-kuba@kernel.org> (Jakub Kicinski's
	message of "Mon, 28 Sep 2026 12:08:00 -0700")
References: <20260928190800.2521749-1-kuba@kernel.org>
	<20260928190800.2521749-4-kuba@kernel.org>
Date: Tue, 29 Sep 2026 10:11:53 -0400
Message-ID: <f7tpkxw405y.fsf@aconole-thinkpadt14gen4.rmtusnh.csb>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Jakub Kicinski <kuba@kernel.org> writes:

> The bridge and the openvswitch code include <net/llc.h>,
> <net/llc_pdu.h> and <linux/llc.h> without using anything out of them.
> parse_ethertype() is the one exception: it wants LLC_SAP_SNAP, which
> comes from the uAPI header <linux/llc.h> pulls in, so flow.c keeps
> that one. The LLC core has leftovers of its own - slab, string,
> interrupt and net_namespace - which it has not used in a long time.
>
> None of this is new, the type 2 removal has just shrunk the LLC
> headers enough to make it easy to see.
>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---

The openvswitch changes look fine to me.  I guess it's just a minimal
header adjustment so:

Acked-by: Aaron Conole <aconole@redhat.com>

NOTE: I didn't review anything else in the series.

