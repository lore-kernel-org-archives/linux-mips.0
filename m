Received: from mail-ua1-f100.google.com (mail-ua1-f100.google.com [209.85.222.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406BD38735E
	for <linux-mips@vger.kernel.org>; Mon, 24 Aug 2026 20:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787604179; cv=none; b=Y+qIkkX2wfW4ya7plIifaIcQ5zw4ngkiEFZR2pN1OvA2Ql2Tz73hFLrsmQ690OK8bHhyIUtB7ybKKXFIMnEWtx9k1AQXMEaVmjQX7DF4dS2UDNhqGs6wC6g0ggFd0mUP/AuaidzUCRJwlAGPnxVoFEW/ol4Z9BwS1r6j8Ra8N24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787604179; c=relaxed/simple;
	bh=2BGCd4wd1eK4boIutygyxqV1lPCKcgGk4dqznaYQlnE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jl7GHengIhmqNXEelzZzDYLOWudrAEapfkLPE7xArBz/eeyOkO28jtB+5x+khly3uGMeLCs/hUqTgyTA8ANz8ZAtF8ZlbTXGOXapCuqE+D+J+1FKs3hk5+WU3KvSOsrwD700byQUvOlc+ID6sfyJW67Jn9uxOUgU6DM5P9envEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=F+TFZzNV; arc=none smtp.client-ip=209.85.222.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="F+TFZzNV"
Received: by mail-ua1-f100.google.com with SMTP id a1e0cc1a2514c-97c441f40a5so958449241.0
        for <linux-mips@vger.kernel.org>; Mon, 24 Aug 2026 13:42:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787604177; x=1788208977;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mcuUPmwyWFcQCNdB2O8b5qx5f5wyg92+G28pjjhsAn8=;
        b=EBzj7X4/1X+JirLJKisfzhxzrqGGDZ3e8ydIP6Rc4xLd1DSbrzhpdgDwWg4dEa0KCc
         yLLPgU+djvL7VxKhGt/Cx+gNH7WIjyJ2m+P8f/1z9Xep9dMptNJFCU/Sx60JU7c9za/6
         lqgFBHjtFYJ81qahWsR8qjygPr+l800bPH8oFx3BaywMDDMpzknPmGZDnGftDucst2Dg
         C0uckzB0c24K1SD77YPzq98zLgnZGOcfj636p4amBwt2TRVV4NFlb61ApuxBSfB9DaH/
         4ZbldEGsRuAXIKnvIyY3Hu7QQYe5e360+/sfnZhpHQiUyq6hKHPap4M2dTQX4AUN21aA
         x4pQ==
X-Forwarded-Encrypted: i=1; AHgh+RrWDbot13K7LBQl2IJMTgLrlFXy7KPvphXIFDhV3GFoavwRiOk/8w4dg5HUmwb4KhkxH3/GrG1bol7N@vger.kernel.org
X-Gm-Message-State: AFuF++mRP3DXzg1ePcUFKzJD7IVqKZ/KaWfiIqBlnYM/LH8kto9VLOIq
	PfsVn/xeILAS6yXOm5Dymhxw9WTJB23f0XcoSJCcV+C0ztMHfS6NA1U6HnoGEGZHnGU7HmTMVau
	MUwFnSvkYyty73FcZNhbVFXbMf5U2BXBpM686aQrYbPOUmy4l8dPSgb+2Re26Frx8ynEPiNQNoJ
	P8rNzPFalbEuZuPsqgIgvoWdA4NEanmy5n8RY493VDTqY8JmYcI7nIfRima+HgvxbWFrpPNPlbm
	qqfJ1hS0fyMt+4YzNbgzw==
X-Gm-Gg: AR+sD10UCa57cIqHsYY3K9b/WnmzLDOOv5I1FiruGFOo4/At9gGIwPBioXkRdNxPKC4
	slkHAU2g1yhvR7Vilq493QtMiLB+3g/t2Nzb6In1TzlS04+wCJrN6khetLSBb1EKd6bmslA6T4l
	YClLncDNMqkzC8Ge8yjH1q1L0GzC9UZeHVzCSrRr7VCyjv4tgGCzny6yDojFDCMzZvPFcWFN3OS
	4CVxH77ZUqZ4cB5mbaqT5La/jpMGTCAg+DrKvEr2tEuvnG0Z/9TnNbvayIgyKaeoFYgfljoN7oC
	g520Nh/CJciFbz6T5KVM+yVErioLD+TCde7YL7ibhEl/w+xIw442Mrw2kWJLWIVKkLNGwTfSxxq
	Lkd3dbqgRiRGz90WVvJlqeBMfRQpjOTOsKXwcz+0FCBMR1AP4xGr/XO77ycDvsk4nNpmgxmMq7S
	qO3LXV2ZTBu/ii4nukFwiktu8W8sBLdNsGFq8t2HH0
X-Received: by 2002:a05:6102:2b88:b0:77a:3431:669f with SMTP id ada2fe7eead31-77a63f32c5dmr9987197137.7.1787604177142;
        Mon, 24 Aug 2026 13:42:57 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-16.dlp.protect.broadcom.com. [144.49.247.16])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-97ca4cc5e45sm155481241.7.2026.08.24.13.42.56
        for <linux-mips@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 24 Aug 2026 13:42:57 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-ca8aee88725so6725917a12.3
        for <linux-mips@vger.kernel.org>; Mon, 24 Aug 2026 13:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1787604176; x=1788208976; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mcuUPmwyWFcQCNdB2O8b5qx5f5wyg92+G28pjjhsAn8=;
        b=F+TFZzNV6l3D5/ywB4yuIB54wz0uoRqAii/SiKbpEQarHa3fVKfCgNyabtpIWdAwjX
         vTLZtnImw8N9t4uhsphb9Nn3gJr7656kClavnGyG8PI15k+fIEdFZe6ZD4jz3sKgsu7I
         wZK1vQb7h+E3L1/ejht9LcGzOZfLerOkriK+0=
X-Forwarded-Encrypted: i=1; AHgh+Rr51uur7DJR0nbJx7dFmsOg7J3UTxjQ6VrAKzNG9FWhY/u8Dw+KOrfE23Oklc5H6v/hvBciRO/Cjl7k@vger.kernel.org
X-Received: by 2002:a05:6a21:1583:b0:3c4:511e:26ab with SMTP id adf61e73a8af0-3cd2fdb9115mr56303220637.3.1787604175785;
        Mon, 24 Aug 2026 13:42:55 -0700 (PDT)
X-Received: by 2002:a05:6a21:1583:b0:3c4:511e:26ab with SMTP id adf61e73a8af0-3cd2fdb9115mr56303100637.3.1787604175256;
        Mon, 24 Aug 2026 13:42:55 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f909a51fsm26738210eec.4.2026.08.24.13.42.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 13:42:54 -0700 (PDT)
Message-ID: <e3f0202d-8bf6-49c7-a27a-7c6986772d37@broadcom.com>
Date: Mon, 24 Aug 2026 13:42:51 -0700
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/45] clk: bcm: iproc: Make sure clk_init_data is fully
 initialized
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Billy Tsai <billy_tsai@aspeedtech.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Taichi Sugaya <sugaya.taichi@socionext.com>,
 Takao Orito <orito.takao@socionext.com>, Linus Walleij <linusw@kernel.org>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Sudeep Holla <sudeep.holla@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>,
 David Lechner <david@lechnology.com>, Abel Vesa <abelvesa@kernel.org>,
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>,
 Santosh Shilimkar <ssantosh@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Heiko Stuebner <heiko@sntech.de>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 =?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Prashant Gaikwad
 <pgaikwad@nvidia.com>, Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
 Liviu Dudau <liviu.dudau@arm.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, arm-scmi@vger.kernel.org, imx@lists.linux.dev,
 linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 soc@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <cover.1787239813.git.geert+renesas@glider.be>
 <28233748ddbdefe6a2eb18127d5cd5f72984ab62.1787239813.git.geert+renesas@glider.be>
Content-Language: en-US, fr-FR
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <28233748ddbdefe6a2eb18127d5cd5f72984ab62.1787239813.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 8/21/26 01:53, Geert Uytterhoeven wrote:
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> Make sure all members are fully initialized, to avoid such bugs, and to
> prevent future breakage when converting drivers to a different method
> for specifying the parents.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
