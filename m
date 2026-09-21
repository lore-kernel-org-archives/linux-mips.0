Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080404A2E1A
	for <linux-mips@vger.kernel.org>; Mon, 21 Sep 2026 14:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790001634; cv=none; b=V0bS6aHyyirzS0HDrpIclJGOfiFigvF6/qHkbYjStic4vE7ROHUk/z2KRhXsqHkN5hUaqn1s4atsGBxneUm4YMHhVw6XshQyyU+SUjo4JiM07d3RXGI4EiohHjHKzAHmlJJn3seqgCIcMFdVS1F3Ijao/IFWdPBncg87fb2Glm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790001634; c=relaxed/simple;
	bh=Vl0OH64ORajM0i6lG8nxGo2msKO1rkc+VGS7OyBftRE=;
	h=Mime-Version:From:References:In-Reply-To:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ijDPA59pkHhqXsOruRM8d6JXRvjbedqFDpRLUJq2hD0M6oqBByUhBjQPx9/GqV1vEi/Td7ixAKgCOgDdu4W9pwBmWUs2oewFuA13u8Zf6UGnS+Kv5GYZywMcDVjZdT+AX8q0VKmnD7PiIAlOwfJYmyQCn4nnlwxnh+OK5zS4nj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=black-desk.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=black-desk.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f15cfdso2873804e87.3
        for <linux-mips@vger.kernel.org>; Mon, 21 Sep 2026 07:40:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790001631; x=1790606431;
        h=content-type:cc:to:subject:message-id:date:in-reply-to:references
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wK8Ax2x0Vv+Ao4SYzfPnuD71riCqpwrI+YZyG1LhWaM=;
        b=m705Rz6G9BCNPnlaJij5veCCP+0qbHk++XWqXnb1cmcOz1h5vPMtYdxulKjTwcbSLv
         fRrDk6BTS0Wr3R7veP5U8LLuY50bj47kwbWrgqXM7hyIfHlfCVlhgA6d6JLZw8U9JGaa
         4OOavNpxNOAOgiPOiRypiCFCKNGqouNJs1lQu8wQb7e1GVFirvbDqNR/s/7wz9jx2XEX
         QBgn2T8DJ0A/g9lofFfPUthbOf/poz/cOaBdcWXHHRZuD5CcHow/E2W5elv6e8TcavCr
         7+0Z4EUG3b5SMO9cKavU1g0adg0IvORcHh9ulto5+3k/6072rA0r1J8R+35583I20xKY
         Leeg==
X-Forwarded-Encrypted: i=1; AKwUvByWJtX9B4rc0OnDaR2DHyANcnRc7jzCIAffCmzUhCmbgb8vPq3I27KkVAqLouNV4u8kDEACjIMRXZwD@vger.kernel.org
X-Gm-Message-State: AFuF++kxIwih1A1IGwytK/mVj7FPR5qvhSzLQynxqK2EWzJ61Slmo22Z
	z7H4CXxgQn0rRMcBjGN7hyrOaromvRgzhbE4C0h1+0ae9x/73uPULSbZtwWuLumpIjukSQ==
X-Gm-Gg: AYBFou1Xmh/fOxrBVu1BQMCD7QUIZ2fMEXiPlVk/DDTTDOfci9vt2FIPHaOXdXGQhVo
	mtX8mAHzPD85yIh9Xi8uRrIwttz5WsoMkqV80Op4kvrZP0iRc+7uPqhq4hQXOIaSvuMNveQ0ca/
	l+z4jRCXGt5M4Ew/plSUrCIXYRyD7TD0eo8vTUCX+OrSNqThp6huOWZyguQUOgZiDrkDmA3XnfB
	hje+5HhRNRX2rFuuhwD6XLsfXjbWLU1Lnvs1NQPlDAR0SVFczdiMjt5c4m7StIf2A8v0MG2MNd7
	2ekJBI3Nx8nVSMYV1vnFHtYjAEbI3gqqnD4b1xd9OMNnYWd+GHu5oVruPrOuS2SXeVoMOb4zdGS
	/ZLNs3DPc0b+K0Bps/j1LCTWhSY1IhfPaxER8NCHc71N42oiUtxJBfvVcDbmchwyPbooJJDm8jK
	hv6WlnFOpNoCxwfmY5kdhljGxpzO1IorbVUICmqCcU+GjEWEtfG42VnF/J95cGufI3vMMsiiGoV
	Z86KsPBjMotuv8rrHAyPbPLvM9Bn4e6mSffNJzq9QRP0UFveDR39Qsk8tRyLZEL
X-Received: by 2002:a05:6512:3a90:b0:5b6:1a7c:59e7 with SMTP id 2adb3069b0e04-5b8c1955feemr3548824e87.65.1790001630835;
        Mon, 21 Sep 2026 07:40:30 -0700 (PDT)
Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com. [74.125.229.204])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8c794446fsm2089817e87.32.2026.09.21.07.40.29
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 07:40:29 -0700 (PDT)
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b76ff64d78so2822984e87.1
        for <linux-mips@vger.kernel.org>; Mon, 21 Sep 2026 07:40:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwtE07PT6hyeASbNQjIP2BJlrboVYod8+UZtFlDb2kqndsFppjfz7DGBmQiDeldf4d9YAWofTQk/Icx@vger.kernel.org
X-Received: by 2002:a05:6512:110c:b0:5b8:997b:c5e9 with SMTP id
 2adb3069b0e04-5b8c184ca3dmr3514194e87.48.1790001629394; Mon, 21 Sep 2026
 07:40:29 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 21 Sep 2026 07:40:28 -0700
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 21 Sep 2026 07:40:28 -0700
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: Chen Linxuan <me@black-desk.cn>
X-Mailer: aerc 0.22.0
References: <alpine.DEB.2.21.2609191504030.27665@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2609191504030.27665@angie.orcam.me.uk>
Date: Mon, 21 Sep 2026 07:40:28 -0700
X-Gmail-Original-Message-ID: <CAC1kPDMo9WCLwuqBYAa3WJhgCjYAth=T66wg9+WRQ1F5CQ8ocw@mail.gmail.com>
X-Gm-Features: AcwNN1VAir1nnbSI5uURp46t4W_M-ZztrmEs-WQGJqbvT5kjopuQVRFVgrr5PXw
Message-ID: <CAC1kPDMo9WCLwuqBYAa3WJhgCjYAth=T66wg9+WRQ1F5CQ8ocw@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] MIPS: Resolve build problems on decstation_64
To: "Maciej W. Rozycki" <macro@orcam.me.uk>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: WangYuli <wangyuli@aosc.io>, Chen Linxuan <chenlinxuan@uniontech.com>, 
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat Sep 19, 2026 at 11:14 PM CST, Maciej W. Rozycki wrote:
> Hi Thomas,
>
>  I chose to rework this patchset on behalf of WangYuli after all; I'm not
> sure if his address cc'd works.  I've reordered the changes to put fixes

Thanks for taking this over. Just as a quick update, I checked with WangYuli
offline. He did receive your email. But he's been quite busy recently.

Chen Linxuan
