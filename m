Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774552DB780
	for <linux-mips@vger.kernel.org>; Sat, 22 Aug 2026 00:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787359262; cv=none; b=lUc8zWkdXS5x0+v1FRiHBF5CCsNw7h/JldGMCpGB3k182fhggC7CYjiTVU36tLonR7OcfBWgA80isfwLiyZVn8hjhqOHpQ/qUolzlCVtF0vv1vCkLfj+UnAOTZnGSDowyd+2GWeVBAzL3bcTK5WU/kElllH66GbEbKFhZT1qyLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787359262; c=relaxed/simple;
	bh=VX0jDR+WpnV3BHXzSyTsEDfjtkYWQukygm7cD0iSRQI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TfGE6+Agh87FhhaG4UNHSpCsnKyFezzaS+iUgAFuFwPRoYCWU4I89e4IqXgL9zq56O8YnCCzHPsmfumLuB7l0YmPpoNSAhp+VU8efG2M75wLshAwJ+HaH8DKw4vm9H3oBbA0OIgGYuVNgfAIYnFIDjC0d6HYu5po9YI63XXLYxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DfULZihE; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DfULZihE"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c966b9ee9cbso1153679a12.1
        for <linux-mips@vger.kernel.org>; Fri, 21 Aug 2026 17:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787359261; x=1787964061; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3y6ksGY7ml8u0XMNQ7kuYAl6QEhnB2wP1GOsjIamDQs=;
        b=DfULZihE1raftrTWMe4paR8fh+WDtOzaC0hA7HioiuM8tTZK2KVCjg31rq4dWdKfu2
         IYAc0Ug9Fq6n2iO7wtmWv/yUrUGjjaRqJ111mcRUBz5lA3XsF2/bpHtdMmHz56LIYtlr
         uHa2jR8Asvb0luX5528Y3z6SmkArdIqu3bfCqGCOqufSsu5YkHheJmE9kkxR9lfbA+SV
         pOQXeHji27NQpX6NlvPv1nX2SVyemlMRhzxMJBNfXm622xrZCUejBsbrZ2kfvQqeZg4L
         2NSfwlTLgVTKs+qqzZEQCeMUhp4jcmIIO0mqClPFX9JKq7XWzxQWLNrPlpPiDpCv/xT6
         b/ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787359261; x=1787964061;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3y6ksGY7ml8u0XMNQ7kuYAl6QEhnB2wP1GOsjIamDQs=;
        b=e12IwKQzsmNcDAwyW1FIjzN9Dgxqst5RDO98OSiwJ9SRKrWIAjqxVQEv38GbMEJlEC
         3MsgFjfE/Y/APyU9Gc2lISz0RXEUQZP2WyvfXuhNhhCoqyR6vX2f9Eq+2CP6mtfwKiyC
         ym7pDt6AIIeWV2D5oCCypE9i0rdSO0wAsHzAgve8Vtmf27dvL9LZdnLb3kHcVKCJeUpH
         0Hxyq1/5y/Ql5seDwlCS3HC4KPqiDbUQx11pG3vpCeaFpntNdo9yKizIVRSVEAIsyJGT
         txlPFJ6Z0W31hG6EJrVzsZv30lC5iFnH3/+HsbDGiBBVqRnzHesOSDBWUjfkcddGcSez
         /9Cw==
X-Gm-Message-State: AFuF++mbrk2WvPULDl/HDR0mSj02t6CohLWQPl6fcNBFcWIVkQXXtVTB
	Cr2BlZAFaI3M0L/Euv1oYNR2fjAvEBOHUbfyVHKrCRozbfEA+q8gzVpN8zAF9gp/B+g=
X-Gm-Gg: AR+sD13Jfhw9IkJIFdiKbdvbBbjg1/of1rcGsMdLDlApxtpSBOj23agyyGJpg3uLdz4
	Ch+FZzoWlDlqafgjy7iENmRpyJfkn/DgL3lXWz/Z28ucw1HZGZ3jMP+iqP+OKy3zYFiQGm6pqFn
	o92O3ULZPqDM2gw4vszImARvT3vAicPWdwkqvqtllqWwuvv86zeuQr6F2G7x7Jjghdrkk5riV0Q
	ZVNPTH+YirtJm9SVphZx07f73zG/lOwe/Dd2L9KLP8bfQ4/BIP44D3rCZOvWnZJI5qMrOsm+HUm
	XbtP5Qz1SYC4vHmr687NSJeeTIyb1sTzGuhzegdMo2Pm0dPPGGEsweNf23sqttX19gfDM6mNoi3
	SqSRBUmzBNnQRaf7NepRz7sv91eizNeRMq/+9bMMTvkzvan/T34wzqaiX2ZfQXf80QcFKKR2jCq
	M3SPaPArdL4PvWkE5wzKYIuF3H3td8CsmG376zdkE/0hPpOKWTcd4c3Rr4ZHO9BgtqVLOOosrFG
	goX6ykyAncuiBxzPGEPWCPkASgzB1PI6YaBK1cOoya8mXiHBzW1jvsMvzUum/ix
X-Received: by 2002:a05:6a00:4c13:b0:851:8bde:7873 with SMTP id d2e1a72fcca58-8520b98be69mr3733240b3a.8.1787359260704;
        Fri, 21 Aug 2026 17:41:00 -0700 (PDT)
Received: from [127.0.1.1] (ec2-99-79-140-187.ca-central-1.compute.amazonaws.com. [99.79.140.187])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8520f161701sm127279b3a.53.2026.08.21.17.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 17:41:00 -0700 (PDT)
Date: Fri, 21 Aug 2026 17:41:00 -0700 (PDT)
From: hanzhijian <hanzhijian1991@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: OCTEON: pcie: fix kernel-doc comments
Message-ID: <178735925266.2386114.4269326939882098876@gmail.com>
In-Reply-To: <20260822002256.2380061-1-hanzhijian@zepp.com>
References: <20260822002256.2380061-1-hanzhijian@zepp.com>
 <20260822002543.2381024-1-hanzhijian1991@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

To clarify the confusion in this thread:

1. <20260822002256.2380061-1-hanzhijian@zepp.com> (the first patch) is valid.=
 Despite what the
   Message-ID looks like, its From: address is my correct kernel
   contribution address (hanzhijian1991@gmail.com), so the first
   retraction below was mistaken.

2. <20260822002543.2381024-1-hanzhijian1991@gmail.com> (the second patch) is =
a duplicate of the first and
   should be ignored.

Please review the first patch. Sorry for the noise.

Han
