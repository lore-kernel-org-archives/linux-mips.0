Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793782133;
	b=Sm8BabADuUYJkLvEcYLRMVASmuUf7TbmSalzYxxFf+ujmSJg0FNjmpIjSg21P1byV+Gn
	 6XRPpI1HOTzCtnFJHa56lHHtPryYtlHg5XDLqqUzKHdJ8gLZM4OjLDtaE+esOu4m7L4IB
	 wpsxGHLpNeeCzvfuLHD4J38ctk2HNO4jVgyeLeoBDQOU9o6xxfQpFVPyk2/P2VLZI+84x
	 JliOrzshkycVl5BSOmz+eKgpk+3fkliSsP6OiFUHVIElkA2D4tC28I9q9/vnvA1bSP8Bv
	 HOEZIjAXpbp4X3SPQxzTMXLoJy0UVg2xuoGW58cg07XlRsakIWAJfcsdqcKsBrmnPYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793782133;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=bKYL0tIwOuQrMDxrCyv61nKmyjjc86ptxINLaNUCb9M=;
	b=ZoftpwXNoflOCqOXE3LnnocA3ue3lNV6PKFa9GyYaHfl7azv2OxWWDUDrr476KlEa2fX
	 7veVhQpfJKu1Sb1WI/vVHN6cLZZlSDvUXeMCqM3+LPgqHtDvColtj6p4DSjYAdAi41rzu
	 UAAqJ1UOR5rqAjysXannXkJ2HnCSQdoZh7/mPTrxlixpLagTG5z4/wCapBS5zhw9Rk3KM
	 a+gFwirI75QH3ia8yo5587Luc9gXNpDVzpz5Be6s4+6TQ3ot80Naamhtc7EdVF1PLR3gu
	 D5SOdETXdhypIyrsH4LmHlHAv8io5sTYTc6X5YLCMdxsKsD57myUN7maSMYQGylwF1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8910606A329
	for <linux-mips@vger.kernel.org>; Wed,  4 Nov 2026 08:48:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8910606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-8490a7d6696so218482a34.3
        for <linux-mips@vger.kernel.org>; Wed, 04 Nov 2026 00:48:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793782131; x=1794386931;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bKYL0tIwOuQrMDxrCyv61nKmyjjc86ptxINLaNUCb9M=;
        b=0goValq4zxgSjr2FgemVP+UVcVFF8GEhoFAlzpxawkNrol/ALsTHwYC+ebsD5uhX91
         NGoeXAnco9yT2QtbfM6k2hkFcrha6C+Lw4P+YuRJGJZTGeFGM+zWkg/rV+l9YX2eZb7Y
         /7StWNu5fgtvszHf2mVrD3AvNPd50XAnuSFUEorV2nwihz14jB8NaR5kj/ytCeABBJ8q
         adq5aWsZaIUB1kciAhZa9hfIlD5HQ6CinKka998892XDyqFHu0JpimXoZwpCnjSUC7EZ
         i8y7fXG7AWw/GEQMIVcGCVMrC/iNEx6QlQqzlFLR2B5ILtbsb7AG/4YvbX2eVYcKvJYg
         sAnQ==
X-Forwarded-Encrypted: i=1; AKwUvBwREqy39gvJ7L2XMTX9mCF9ktoJGUYSpPmgobEfWvtxuivTrEwEI8CZkes6380PCTsya7mf6tKAZIjw@vger.kernel.org
X-Gm-Message-State: APuU4Z/E/jCPNjL2ftiDyQZRlSjRitVQ3AZgYDPulh9aFuBoY/dtn8e5
	+4fEZ4qxk9b8f5v4gx+QkrnHAjC58Sw3rr6+dcqQHcSaZLWI1f+IvNpCiov8OlR64tw=
X-Gm-Gg: AYBFou1HWkGLw0NBDpw+Wcx3PiwuiK4dU40V7ry8ahWUzx8bNP80AmirG3YlL9nAB76
	KruBcVN6P2WvHja63O3xczRyHfuMDeqZD229Qm8o5pO39eLs2RBE8CSWVGqPq+/+UNpyK+IX4/x
	SuNjb2X/UoANBh6uOuM13fFOizgfhKfv2ueK2508g6iUHAjhm3hM0M+CYQOERzuX3IJndwoprsA
	bNkq6WUwD0TAVt7VTcli9Em5dCYnZ5yQwDZz70rURk6/udIofFgkO6gHSzRNvcoSplYC+FpfILd
	cBoCtspXifnlkfNPBlV6WOU0+qQyAAu1QhiDcvRXiTt8mkVIz3/sioSxtWzoU4Oef4kCO61cMEK
	lXprxE5SzMVy/S/D05mxMuElrQZMQVgd/aXl2eMJR9bohv80B5FIGrYl5sdDE2ESAmU6SlHrHaU
	5twhcQ+h6bZ7UdN77g5N/aRJpx28Fk75aIvMaMJZzNXqKwM3NLCMNAhr80Egs8dQpjb4M/YYfW1
	dAI0fjZPO7oj+I0d36LsWqt4FIJ2dzfJL3dVPU47+76E4A4xRzupcfNP6/3MkCPoHjzXvfGRw9d
	gp1uGla8j+Q8v4SJK/VeUxkwRFc3eynqSJpCvbc4tB4Ryx+FHEU69rKGwNcYsqjZS1TVw/98yRc
	g7ijlJ6NHLajURWEPMH+gq8/BSSylEbFK3PdUNNTE
X-Received: by 2002:a05:6830:4392:b0:806:1e7:4167 with SMTP id 46e09a7af769-85d364db74amr11711157a34.13.1793782131659;
        Wed, 04 Nov 2026 00:48:51 -0800 (PST)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com. [209.85.161.50])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85ef3e710fcsm1450334a34.22.2026.11.04.00.48.50
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 00:48:51 -0800 (PST)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6dde81a6820so274324eaf.2
        for <linux-mips@vger.kernel.org>; Wed, 04 Nov 2026 00:48:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBytFi2focCs6lRKmVfUDgmcH58Qj3JoL/lTB22bs1dX2K9MN6PMMuEOf4N55RcA39piw8+mkorP4hM5@vger.kernel.org
X-Received: by 2002:a05:693c:6407:b0:36a:7b3c:4e0a with SMTP id
 5a478bee46e88-36a7b3c4f8dmr7297124eec.24.1793781644445; Wed, 04 Nov 2026
 00:40:44 -0800 (PST)
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-gmac-v1-0-a15965a49574@telaak.dev>
 <20261104-sf19a2890-gmac-v1-2-a15965a49574@telaak.dev> <6e8d69e3-9404-4a80-874e-0133f942229e@bootlin.com>
In-Reply-To: <6e8d69e3-9404-4a80-874e-0133f942229e@bootlin.com>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 03:40:32 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ5RZFkQh5G0BbgC7FesQQbQ53AJQv6pYoK+YEVo8k62bA@mail.gmail.com>
X-Gm-Features: AclHuK9Odzf_wS7Gr7Do7DU0hVIY-1521pU5hfzHYwAlyguOls_NqIQeDv60H-0
Message-ID: <CAPY4CJ5RZFkQh5G0BbgC7FesQQbQ53AJQv6pYoK+YEVo8k62bA@mail.gmail.com>
Subject: Re: [PATCH net-next 2/2] net: stmmac: Add Siflower SF19A2890 glue
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Chuanhong Guo <gch981213@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, linux-mips@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

> This is only used during the probe sequence, you can simply pass it as
> function parameters, this avoids using up memory to store that :)

Thanks, v2 will pass the device to the delay helpers and drop the
member.
