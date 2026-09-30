Received: from mail-wr2-f41.google.com (mail-wr2-f41.google.com [74.125.225.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CF9457E5F
	for <linux-mips@vger.kernel.org>; Wed, 30 Sep 2026 08:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790756151; cv=none; b=V0rUQcgVRPzUtbj5wnRJ+I5FTDwuQG/d76t389iFnQzYLIH2fQjqVn9utXOuyqej9Z+xlk3p8Yuwys4RV5J7hQ9ARmVuEoGGFOTHtpKi86Da8oi2dUQBu3hT7Oa4O9lT2+nAh4bew8Kd84N/cZrY1Z51SRaK8gdJaGyCYIxjT/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790756151; c=relaxed/simple;
	bh=hGf5SHT45QhXMybO439QDD/6j27QAPiOqO8zt+9Fe7E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RfWsYZ+62qUZE86crdGWqvilJdkJgf4dKTBoA4QQnerk9boQDeImJbrdrP2HqCClbIY+KQnrb0sOzSb9pkkrIAcv9d/Ey3lpbGvALB9cwPdeR7DYP6lSXOA7jvIPKgetAcVCiydwKcd0qEbAS3BNbIWwxFtOb86QGtATjaCdeoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org; spf=none smtp.mailfrom=blackwall.org; dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b=XBWKm/RS; arc=none smtp.client-ip=74.125.225.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b="XBWKm/RS"
Received: by mail-wr2-f41.google.com with SMTP id ffacd0b85a97d-4834977ae75so3047720f8f.3
        for <linux-mips@vger.kernel.org>; Wed, 30 Sep 2026 01:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1790756147; x=1791360947; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wA9u/pcTwn6WeT/1p6tUVMcz40b3lP8bbas9LYvDmjg=;
        b=XBWKm/RSObYh0Pf2S8swemfMfRues6nP/WXgkMyhbUXuSqasnXe0M/Keso5jCEagCd
         KTvIkS/8thFB0ay6iEkKQ54gfArH4eH3q8FTqHgxB58wrcP4r8a0P9kRLV+MN9REYbtn
         HQ7WF8CV0hHUFOxhfg94Z1I8Iugi1EKBZC7tUpyBfU0RYjovDEMM1380VcotGhB4faW8
         szdyxUyKx4SEuDQIWmsxlh8eS17/vsUFnL77eJn7pl19syNpsl8RItoJQKFBrgFuSw31
         mljelADf6qlgvp6qvmH8W1MTOQUhC4RzRduT/ixnNmq4y3tgfLz7sauxjQToz69hMxeH
         73PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790756147; x=1791360947;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wA9u/pcTwn6WeT/1p6tUVMcz40b3lP8bbas9LYvDmjg=;
        b=v7PE+/yw3BBDJuA/Y0paBlty4OT1dyaR+LOAZsmVVPoqZDanV2SD4WTfdafINwwgJs
         tchxzeykOi+D13lKTVLdmVrJWzrDUI9aZDJ3zltMby171OqGCQ1q7G/LGTRCV4+Zuhzq
         /gSqBQyfSj9n5WJw0K6v03OFOOu7AdVoFF6mRFr9WNHVC2Tz3L1UYdoSxrcH8SMEGKKL
         YU3YKjey47awlv185N93Hihn6i02OV0nMa50jGR+v9xIUOJzJEEN6JylU/DdTBypgnoq
         ho2KtzAYkn28s4JyREiBDAQamL7VLwId7fTIC7sWnN7EtbUWsqljeY/nZkTCzfUpgULY
         QJwg==
X-Forwarded-Encrypted: i=1; AKwUvBzpfZmwP0gew8mP5alvQXgFtRT/fF9ldTUlbaZjWCzAK9clcxUiB0MLCqJ08qQMG+xqCZkb2QKWuh83@vger.kernel.org
X-Gm-Message-State: AFq9FYIuJDoycBM8QMgwxiyw/osJTfo3QYjjNS9vUdCSjUlC7lX6Nk/a
	ADC31GM2b4Y63IQVrYylvmHKqTdXMdcxANUu9+gB0mJpaDCW7BjqUnya8bHzU3Fh09o=
X-Gm-Gg: AYBFou0OXcLqzqs+iEBqFWMsz8svlrj8g92c35vR7ZIviUWYxZEt0DzzwNxiZX/AbcJ
	5ba5n3BYJNm9O/MxkY+sl4NQ7wSqo6pisDWfYtC6DC6iAJ2uQ5wmtdCQNXJ8g9+gGGcEqhKcFte
	/XbfrPth0wKM68m4RHYIXjKcu4X2m2gZKGtrtCXDcmHynA5S/UdNTBcPJ/IPzJ606lNTMROM+FR
	ZnNqUhOR1WLz9cNjg/4OncICsjbBFhy4t+gJi2IGbsHeMviUuHZi8oPJdpW4O0C0Ev3jbmqSz9d
	vIDIADxl9mJDtzU05rTPjfBWytMuCcJNIHnkWmI9VmCmot7BJOLTmUZdouxBhmv+Kd3HLqJgVLn
	GAxJerFvwvsGhUnYSKwoE976Lgtsts++2QB2ogPCa+cdOG65eUJfNySq4Zv6lUi0hfxy1u8oFN5
	5GdD3diZv5g9PuzwDsHSCV6ZtgZWobYNJdWvarZNAvBDAQgqXo9Mb2GiExYKe1FL/LEJKsvIUdg
	DiWnTQN4DAU+qBIk5tyWkZ2OQxEtT7N0GNJRuY=
X-Received: by 2002:a5d:5f92:0:b0:488:89a6:b37b with SMTP id ffacd0b85a97d-48b02525e7fmr1290363f8f.43.1790756147193;
        Wed, 30 Sep 2026 01:15:47 -0700 (PDT)
Received: from [192.168.0.161] (78-154-14-127.ip.btc-net.bg. [78.154.14.127])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b029e0e16sm1679272f8f.17.2026.09.30.01.15.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 01:15:46 -0700 (PDT)
Message-ID: <4e71fcfa-f733-4c4e-ab98-da8cd0531a02@blackwall.org>
Date: Wed, 30 Sep 2026 11:15:45 +0300
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 0/3] net: move the type 2 sockets out of tree
Content-Language: en-US, bg
To: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net
Cc: netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
 andrew+netdev@lunn.ch, horms@kernel.org, kernel@xen0n.name,
 chenhuacai@kernel.org, tsbogend@alpha.franken.de, deller@gmx.de,
 idosch@nvidia.com, aconole@redhat.com, ardb@kernel.org, tim.bird@sony.com,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org
References: <20260928190800.2521749-1-kuba@kernel.org>
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20260928190800.2521749-1-kuba@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/09/2026 22:07, Jakub Kicinski wrote:
> LLC2 sockets are admin-only already. We have been getting a trickle
> of LLM-driven fixes for these, even tho we don't know of any active
> user. The code is so bad the LLM fixes just turn into a never ending
> stream of revisions and follow ups as fixing one condition reveals
> 5 more bugs. Let's move this code out of tree.
> 
> The series itself is LLM generated, the LLM was also nice enough
> to generates some tests and validate that the OOT module actually
> works.
> 
> Jakub Kicinski (3):
>    llc: move the type 2 sockets out of tree
>    llc: strip the leftovers of the llc2 removal
>    net: drop unused LLC-related includes
> 
>   net/llc/Kconfig                             |    7 -
>   net/llc/Makefile                            |   10 +-
>   include/linux/llc.h                         |    5 -
>   include/net/llc.h                           |  108 +-
>   include/net/llc_c_ac.h                      |  180 -
>   include/net/llc_c_ev.h                      |  217 -
>   include/net/llc_c_st.h                      |   46 -
>   include/net/llc_conn.h                      |  114 -
>   include/net/llc_if.h                        |   63 -
>   include/net/llc_pdu.h                       |  379 +-
>   include/net/llc_s_ac.h                      |   35 -
>   include/net/llc_s_ev.h                      |   61 -
>   include/net/llc_s_st.h                      |   32 -
>   include/net/llc_sap.h                       |   26 -
>   net/802/garp.c                              |    4 +-
>   net/802/psnap.c                             |    2 +-
>   net/bridge/br.c                             |    2 -
>   net/bridge/br_stp_bpdu.c                    |    3 +-
>   net/llc/af_llc.c                            | 1304 -----
>   net/llc/llc_c_ac.c                          | 1448 ------
>   net/llc/llc_c_ev.c                          |  742 ---
>   net/llc/llc_c_st.c                          | 4940 -------------------
>   net/llc/llc_conn.c                          | 1025 ----
>   net/llc/llc_core.c                          |   28 +-
>   net/llc/llc_if.c                            |  151 -
>   net/llc/llc_input.c                         |  128 +-
>   net/llc/llc_output.c                        |    3 +-
>   net/llc/llc_pdu.c                           |  366 --
>   net/llc/llc_proc.c                          |  245 -
>   net/llc/llc_s_ac.c                          |  220 -
>   net/llc/llc_s_ev.c                          |  109 -
>   net/llc/llc_s_st.c                          |  177 -
>   net/llc/llc_sap.c                           |  437 --
>   net/llc/llc_station.c                       |  120 -
>   net/llc/sysctl_net_llc.c                    |   71 -
>   net/openvswitch/flow.c                      |    1 -
>   net/openvswitch/flow_netlink.c              |    2 -
>   net/openvswitch/flow_table.c                |    2 -
>   net/openvswitch/vport-netdev.c              |    1 -
>   arch/loongarch/configs/loongson32_defconfig |    1 -
>   arch/loongarch/configs/loongson64_defconfig |    1 -
>   arch/mips/configs/gpr_defconfig             |    1 -
>   arch/mips/configs/mtx1_defconfig            |    1 -
>   arch/mips/configs/rb532_defconfig           |    1 -
>   arch/parisc/configs/generic-32bit_defconfig |    1 -
>   45 files changed, 33 insertions(+), 12787 deletions(-)
>   delete mode 100644 include/net/llc_c_ac.h
>   delete mode 100644 include/net/llc_c_ev.h
>   delete mode 100644 include/net/llc_c_st.h
>   delete mode 100644 include/net/llc_conn.h
>   delete mode 100644 include/net/llc_if.h
>   delete mode 100644 include/net/llc_s_ac.h
>   delete mode 100644 include/net/llc_s_ev.h
>   delete mode 100644 include/net/llc_s_st.h
>   delete mode 100644 include/net/llc_sap.h
>   delete mode 100644 net/llc/af_llc.c
>   delete mode 100644 net/llc/llc_c_ac.c
>   delete mode 100644 net/llc/llc_c_ev.c
>   delete mode 100644 net/llc/llc_c_st.c
>   delete mode 100644 net/llc/llc_conn.c
>   delete mode 100644 net/llc/llc_if.c
>   delete mode 100644 net/llc/llc_pdu.c
>   delete mode 100644 net/llc/llc_proc.c
>   delete mode 100644 net/llc/llc_s_ac.c
>   delete mode 100644 net/llc/llc_s_ev.c
>   delete mode 100644 net/llc/llc_s_st.c
>   delete mode 100644 net/llc/llc_sap.c
>   delete mode 100644 net/llc/llc_station.c
>   delete mode 100644 net/llc/sysctl_net_llc.c
> 

Reviewed what I could, generally sounds good as well.

For the series:
Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>

