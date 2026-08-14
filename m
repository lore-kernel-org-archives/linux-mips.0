Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811A53D9029
	for <linux-mips@vger.kernel.org>; Fri, 14 Aug 2026 10:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786702447; cv=none; b=U80GMHvNAH5MeiEpZtvOTzAW4tUCmhRH88IvSmsvve70/mb/I//WQ7WP2RVechTYsjDmAUBuprvztSyvFBAX2uw+SQpoNTiDe7svR2u0Os66qu2vMnPMw+EFcJJ8QgPqvfYTHHd/MTPGBqFq6W4Bt+FhBV2+FwxyHlV804AWBLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786702447; c=relaxed/simple;
	bh=Fean+RnrRmH5yBHcXW6hh9Wfxwzlvz5Lyo2kbq1z8Pk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=noTaZqzyId2OeuC0UXpXFz95WBTU2bzIWmrYvCtXIVeqm5Fq/QS9AeIaDc3jPJl05JS5kS0/7+EGX+tmFiotu0RKTXFdp19I5DlJNFPhfqhWU3Dv0nWK38XwnzNAVD1WbPWqFF3mfLlEFKdE3CfkoyGjRTHI4iizIT4HzmAKe0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LzsO4PZ9; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LzsO4PZ9"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2caf228a910so7641385ad.2
        for <linux-mips@vger.kernel.org>; Fri, 14 Aug 2026 03:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786702434; x=1787307234; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Fean+RnrRmH5yBHcXW6hh9Wfxwzlvz5Lyo2kbq1z8Pk=;
        b=LzsO4PZ9INKWExex6wd3ef9Moi0+SnTR1g7MDtngRZQ/qRqRkZx+mp16+GmaC75GVO
         g2bnk8irZt4r96hB9kXwElFuBrZLY5HRSCwykenqd8uZJ2ofLXnk3yqpsbxF8K4yes70
         esEjikTsXK8PqKjqpWoGl+LYQhAGbOpLBcB35ijfq22F12cUnoR+9vpsIYWu/0bAvCo7
         7pVAUPZO4N1ZuqttejWpqCK7wx4FQijHQuxYBXX1y4ZbLT8TSWzVeVtpVk3gqKmQe3tm
         IFliOqiDcSNzOT6gu82/BHad5PoQrDCAaq19dgB+5C5q34FXwxlCHI+5UzXoRAvOm7ES
         hj6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786702434; x=1787307234;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fean+RnrRmH5yBHcXW6hh9Wfxwzlvz5Lyo2kbq1z8Pk=;
        b=rbuNgjFA0YOUB2SA8wtGPJrc/vpTZ19pLLs+ae3w7ppuJLgudJiWE5FL801RekAKch
         utMK67+ZjAiQHWPaV/j9QXrg/cpJCJE/o1nyV5DmCTS9nPWT0M4Ykc6dHhE1dIg+uerW
         67wYrKzWZ41Ow4Q5WlufvRVatDSQxrI7ZBaqF6OieoKfXafZ8bRuVfqxmyCXMt61sAZl
         cpTPVmHat/wNxn5rO2kwyQoosq1v7yBCLHj38fAXNm+g1aQ5NM6tq+YW/PEsgceoDMRw
         m6gNcWfjI8po/rmXNKH96EFkRMfxcTTTXRDwBhq+wOfyGD+xqP+XW7TOP/ziv3fSxtjX
         16Rg==
X-Forwarded-Encrypted: i=1; AHgh+RoS+9pCAf1Oe3jfgviwyRFWlgORWSEDQ49Oauv14u8b3HNsJqXxH3awZZsw6UNqo96L21VlvHq9gYe1@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+J1meBdQCSE7CBFzZDP54+jEm8IDVZoMIJ/UjrgdTNj+85naI
	/pG/nQiAO3GvcmBy89zn+s6ADjKXGV6M7yqrmpfSIynwq683ybC05/0/
X-Gm-Gg: AR+sD120GOw1eyyjz0V4aTxKjx1KHgQf4CdhGAQ+VEC6BmOnje6v1gwDN8ts02G20ew
	A8mCKrUF5Y5lcADHfha2pvJaiw4Y/fSVIN0fFY/ApIQbl/F7az07oczle5aDjJDicP9rnx4ntdl
	vWqytpxly8FJNW4QvaxvkkT7hi3Dld1Ki83d/k8C5hNDtNdNjXHXLmuymQOZhzDJ6CGZw5fBZUT
	QBNA+fGQO1p+mo/ivfSXQ6pUbKpN9wYfCDCvZdRqyljMhFMIk6k6Tozk0FgRGDh7o6hoo/PwWNS
	DZTd+56yqow49Oe8Uz9CHDEdo/rTZD5mib7kdIdWA+g1h6CmQftoysqcJGXsqN5CPI6FMaMeVIU
	DlIYeNJQs5LfNnS86NOXObbU33/P7H9UVcYrQzKUtiCZTpHxKUDy6d2waOGQjJzlQVlsT409GSk
	5PLvFWz3GXMAVhV/syEkXedEKjrtvQjrvz8fI98pF8l10w50oFuEQ//q0OoSOWwXKAsFkuvg==
X-Received: by 2002:a05:6a20:12c8:b0:3c1:85d:fa2f with SMTP id adf61e73a8af0-3cc71eb2723mr4675562637.36.1786702434016;
        Fri, 14 Aug 2026 03:13:54 -0700 (PDT)
Received: from localhost ([2400:adc1:447:6d00:6351:4475:eeb9:18f1])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387e49d3sm8058237c88.7.2026.08.14.03.13.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 03:13:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 14 Aug 2026 15:13:41 +0500
Message-Id: <DKOL5D2FVB6K.NBYEX23T8EPG@gmail.com>
Subject: Re: [PATCH v2] dmaengine: loongson1-apb-dma: avoid using iterator
 variable after list_for_each_entry()
From: "Mahad Ibrahim" <mahad.ibrahim.dev@gmail.com>
To: "Mahad Ibrahim" <mahad.ibrahim.dev@gmail.com>, "Keguang Zhang"
 <keguang.zhang@gmail.com>, "Vinod Koul" <vkoul@kernel.org>
Cc: "Frank Li" <Frank.Li@kernel.org>, <linux-mips@vger.kernel.org>,
 <dmaengine@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.22.0
References: <20260720142538.2766-1-mahad.ibrahim.dev@gmail.com>
 <20260729143247.6111-1-mahad.ibrahim.dev@gmail.com>
In-Reply-To: <20260729143247.6111-1-mahad.ibrahim.dev@gmail.com>

Gentle ping.

v2 has been Reviwed-by and Tested-by Keguang Zhang.
The patch has no outstanding review comments.

Thank you,
Mahad Ibrahim
