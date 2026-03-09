Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE6A3D6663
	for <linux-mips@vger.kernel.org>; Mon,  9 Mar 2026 14:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773068293; cv=none; b=kPEQaShovMdnUTIRSdAle44yI6Aly+GbHaUmU/hDgR3D11v5jH088vFrgaTlfcRcHEIHtH4FstPVpJuG90ONs23hx37hSbuXRcw80/v7Uh5o6fBAKGMLWRBPPfv5U8otwipS4+K0Zs2TupmMu+x+9eFPoa0h8mI2VkHHxpRMXV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773068293; c=relaxed/simple;
	bh=wJPB7UPd7El25mJdue1MKD7YwBnP+67VFnImxa+295c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OlSl6OI5l8oe13vltIK0h+B3tCVoYOiX4h0tfyEKLWpa+9x5GqEdFb7E7BIPjLhDk5b20gA7RidL8tYR+r48eZ9f1EIbD40Niz9WDS7N42cn602dIiExvMf06D0NkrF2V7x1vQ22/y+36OOGrPaiTZNjee0W/4ng0U0DA/I4CIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F5HPZAT9; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=M05MtgxA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F5HPZAT9";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="M05MtgxA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773068290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H1BNKFyRsZcHlEZIOZ9hlANGFti9fPCQQJkxNtYA6no=;
	b=F5HPZAT9m+7LgzjRXaLwLcPRJ7C2c9y4OMRftQ6DNzZNsvYVwuxs/F/6ehRuD6h6UxbCxq
	upBkvx2KePZJQN00R3JbqgHwj70AOgfGcRtG+Kxlvu3etoXtIKHdwikhS5w375vkcUnX+M
	4d6oAhoFX7EHbvoc65bSwKiE7UnMfZI=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-42-GsGQPF5BPrGJMg8hW1hTcA-1; Mon, 09 Mar 2026 10:58:07 -0400
X-MC-Unique: GsGQPF5BPrGJMg8hW1hTcA-1
X-Mimecast-MFC-AGG-ID: GsGQPF5BPrGJMg8hW1hTcA_1773068286
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50923a9bec8so4897301cf.3
        for <linux-mips@vger.kernel.org>; Mon, 09 Mar 2026 07:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773068286; x=1773673086; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H1BNKFyRsZcHlEZIOZ9hlANGFti9fPCQQJkxNtYA6no=;
        b=M05MtgxAvJdt+JBg+1HHMdpJDPkmUTfnvmGGa8WHt4moBkW7XQL52Vw+jZhpJgNntp
         RaQjvZPC/gVfqol1teZMDwuJiH/CvBSsQzEeZtY2aHdwQMxwa2BBUmcndH/rUycYUlMO
         0CErWrFO2Hz5bjUhMgVXQDeYKqonDestivCln+m2zvEljBFeQHyW6nvY5G4rAF8cN87R
         lN/e4fYKLl7w81zKnLRr899dBrtMybFkhsbnyP7N/yk1JGSqZVC/KbHqwBw8mNf3Mqwm
         lszS+Me4x2Q1LD8Hi5Te29gPp5xhGLS7hDDxmGnK2HarlL3iHk/BQUx3Rv8AophqhoeT
         CiZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773068286; x=1773673086;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H1BNKFyRsZcHlEZIOZ9hlANGFti9fPCQQJkxNtYA6no=;
        b=NsV5c6UYFoNZWkdjEM8Y3XgbZ1hz7lCetMDjAKoQ2tkSselBJN4jtXzUGSWXxSZbSQ
         RVWbKxO9NzNqy1DYNJOskFTopKKIH6nqFO8C1dOBQ1H19B097/0uzZoKkKzX/K/Um/G7
         mzBYPS4jcprTZxZ6tHRnHi3q0UjTXWT1tTtZLD065E2oatExON2WhEfe8Ui/L4a1n5WK
         E/KXXm0Xd9P58RaXF8YTnzAPE/iYxKqt4i3ighXqJmRTQLFTMvYfLL45LPr1185PwDaa
         eonyDOZWQHhOh544p9NfbIgCCUk8mCO5u/bYDsps8M23OP+5guyuDyoclXBH/2wQds/n
         UMTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAAtlTm+XZpO3+2vp/4u3HYEJQONiLoA0qcdAa+XVccXMdYtRS0/WYx1fIG3NpLVasRgCOA0hs9GIV@vger.kernel.org
X-Gm-Message-State: AOJu0YwuuPcymHA/+NgFylW9KV1HR7oh0gQ/y2HNxbt8FvnuNmKsfcwE
	RscvfjAQrOVdEVZS7PpjQuQSV9aLIky+N2bZ4QKr9HstC+haK3N6MR/foL1kSXJGzrJ4PUVjm6O
	9FHp3eu+BIrvIRljgEmLCr2s59/pWU2eDk5sf2JaL1ret9GFAT2B/zZtHk8PmdYk=
X-Gm-Gg: ATEYQzxtpRl7LmUiYMayy5TTZXJmU7Sn31iVZ00QTGUAGH2A6ukdWrS6l5VU/btYLYt
	5rGJOAMEz22m5p+xhjLlW6+rZi58minhtq9QXmQiFzfEwm6rHbutg0QS++fyanUO81GnT9lHiaz
	rTLQopYM8/K7Fm45WFlUJzTvl82Irq6dEey4gPUlsNItGRI+aPkD6n/EVrO52uMM28I3yH1P5V4
	LdoG45PnBUFhNzF918lYpz9JszRzPwI6+2ayis1SoOTDmQSj57RrIILu91swbrYe0YWw6nDS4aV
	HE1XJk5VQ6kX7+5FMIvWo/c4J7ZdVVC7GuXnWBLGyFHNkWIiPZZpIYvef8UZlXzbBeVpjwHg3Ew
	Jjv/NDkiOC0r0D8VLi5w6zhvGxjazL/BUpLUnpMCrEiXbtHtf6BZtt2ly
X-Received: by 2002:ac8:7dc1:0:b0:4f1:ba0b:90 with SMTP id d75a77b69052e-508f46e67d2mr142736441cf.8.1773068286439;
        Mon, 09 Mar 2026 07:58:06 -0700 (PDT)
X-Received: by 2002:ac8:7dc1:0:b0:4f1:ba0b:90 with SMTP id d75a77b69052e-508f46e67d2mr142735841cf.8.1773068285876;
        Mon, 09 Mar 2026 07:58:05 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-509009ad4basm50577251cf.11.2026.03.09.07.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 07:58:05 -0700 (PDT)
Date: Mon, 9 Mar 2026 10:58:03 -0400
From: Brian Masney <bmasney@redhat.com>
To: =?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: Re: [PATCH v4 03/10] clk: fixed-factor: Rework initialization with
 parent clocks
Message-ID: <aa7f-yq6e4WpxNrU@redhat.com>
References: <20260304-clk-eyeq7-v4-0-9d6bd9d24bec@bootlin.com>
 <20260304-clk-eyeq7-v4-3-9d6bd9d24bec@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260304-clk-eyeq7-v4-3-9d6bd9d24bec@bootlin.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Wed, Mar 04, 2026 at 04:25:17PM +0100, Benoît Monin wrote:
> Use the same sequence as clk-divider, clk-gate and other to set the
> parent_names, parent_hws and parent_data in the init struct when
> registering a fixed-factor clock. The number of parent clocks is now
> only set to one if a parent clock is provided.
> 
> Previously the number of parent clocks was always one, forcing callers
> of __clk_hw_register_fixed_factor() to provide a dummy parent_data
> struct with an invalid clock index in case they were not provided with
> a non-NULL parent_name or parent_hw. Drop this dummy parent_data as is
> not necessary anymore.
> 
> This change only has a small impact on mis-configured fixed-factor. Now a
> call to clk_hw_register_fixed_factor() with a NULL parent will register
> a fixed-factor with zero parent while previously it was registered with
> one invalid parent. In both cases the rate of the fixed-factor is 0Hz
> but it is no longer shown as orphaned.
> 
> This has no impact on properly configured fixed-factors clocks.
> 
> Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

