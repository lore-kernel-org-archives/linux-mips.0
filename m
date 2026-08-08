Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC768388899
	for <linux-mips@vger.kernel.org>; Sat,  8 Aug 2026 13:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.238.66.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786195227; cv=none; b=jaSQCdPV2kggdwzNEMY/mQ7sJ7kiW8xdAy6Np/JmYwxJ8sQNxkIL4KXXxAaj+GCf8ug8g4xg2FLuM1i0wb8KH9iCQ49v1HNQ2lnfZ6AhRB8LhgTkD/zT9vRFT1qiYUf9Tu7owJ9mZCtdsXhCPzTgbTOlPmvafZDGHZlKniP8FOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786195227; c=relaxed/simple;
	bh=TWuB1P8c6rIUBarPcauvL8691fz6LD7npJbfUga6e48=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kxVQPUJ7/49wSqfak6iQgMh1d6kUsKNNT723UHYX9GlwCV/SAStkpiC3NopVXRCC1LV29iSN8j9bgDzY+fulqN4ehvtBQsceKOBHFIrorzXImAUl+LnmlqqLbQ95sd0y1e91e263fkBJkWFZyBF8DSs5FeX5kvly6mv5sG37QFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openadk.org; spf=pass smtp.mailfrom=openadk.org; dkim=fail (0-bit key) header.d=openadk.org header.i=@openadk.org header.b=CYTUXul2 reason="key not found in DNS"; arc=none smtp.client-ip=89.238.66.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openadk.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openadk.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=openadk.org header.i=@openadk.org header.b="CYTUXul2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
	t=1786194913; bh=TWuB1P8c6rIUBarPcauvL8691fz6LD7npJbfUga6e48=;
	h=Date:From:To:Subject:From;
	b=CYTUXul2w0rwvVQub5qEnK0/SCtRYNIcIFbO8H3w8HRO48mdTYFixutjhw+XUISo4
	 XvVWWy/hIPkRrpuI8KxwDoFtJxm38BWiGNcMLqE8KJXOJ1yWAnWgpqQv9o3tfP6yVp
	 FCG7q1791T1f+Xb2C9NSSk4d9Qb+HkSWpo9E2KMWSlDASlwyH7YwYVKe7RlX9p4liT
	 LHxz+jyk2P/VccREfthe5JUD1ninnieWWKFvrdr/zNkB38WX2AWjkxnfnpDWHwoytO
	 ScsBgHUDjIfzGbuw9T8JdLrEly+zFlYoJULb2iJB3GEPP3tx6G69kavHNZIPvIVbzS
	 mKRO4/9KgMUVw==
Received: by helium.openadk.org (Postfix, from userid 1000)
	id 5041731E0D33; Sat, 08 Aug 2026 15:15:13 +0200 (CEST)
Date: Sat, 8 Aug 2026 15:15:13 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: linux-mips@vger.kernel.org
Subject: imgtec ci20 HDMI broken
Message-ID: <ancr4X9BNc3S0sC3@waldemar-brodkorb.de>
Mail-Followup-To: linux-mips@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-Operating-System: Linux 6.12.96+deb13-amd64 x86_64

Hi,

I recently played a little bit with ci20 devices.
It seems HDMI is broken in Linux 7.1.6.

Here is the kernel oops captured via serial console:

[   54.997593] dw-hdmi-ingenic 10180000.hdmi: Detected HDMI \X controller v=
1.31a with HDCP (DWC HDMI 3D TX PHY)
[   55.491338] dw-hdmi-ingenic 10180000.hdmi: registered DesignWare HDMI I2=
C bus driver
[   55.899132] [drm] DRM bridge corrupted or not allocated by devm_drm_brid=
ge_alloc()
[   55.904136] ------------[ cut here ]------------
[   55.908753] WARNING: lib/refcount.c:25 at drm_bridge_get+0x58/0x6c [drm]=
, CPU#0: kworker/u4:2/36
[   55.917538] refcount_t: addition on 0; use-after-free.
[   55.922553] Modules linked in: ingenic_dw_hdmi ingenic_drm hci_uart dw_h=
dmi v4l2_fwnode drm_dma_helper drm_display_helper drm_client_lib display_co=
nnector btbcm b
rcmfmac_cyw brcmfmac_wcc brcmfmac_bca v4l2_async msi001 fc2580 e4000 drm_km=
s_helper brcmfmac bluetooth au8522_decoder xc5000 xc4000 xc2028 videodev tu=
ner_simple tda1
0071 tda1004x tda10048 stv0299 sp887x sp2 si2165 si2157 rc_zx_irdec rc_xbox=
_dvd rc_xbox_360 rc_x96max rc_winfast_usbii_deluxe rc_winfast rc_wetek_play=
2 rc_wetek_hub=20
rc_videostrong_kii_pro rc_videomate_tv_pvr rc_videomate_s350 rc_videomate_m=
1f rc_vega_s9x rc_twinhan1027 rc_twinhan_dtv_cab_ci rc_tt_1500 rc_trekstor =
rc_total_media_
in_hend_02 rc_total_media_in_hand rc_tivo rc_tevii_nec rc_terratec_slim_2 r=
c_terratec_slim rc_terratec_cinergy_xs rc_terratec_cinergy_s2_hd rc_terrate=
c_cinergy_c_pci
 rc_technisat_usb2 rc_technisat_ts35 rc_tbs_nec rc_tanix_tx5max rc_tanix_tx=
3mini rc_su3000 rc_streamzap rc_snapstream_firefly rc_siemens_gigaset_rc20 =
rc_reddo rc_rea
l_audio_220_32_keys rc_rc6_mce rc_pv951
[   55.923042]  rc_purpletv rc_proteus_2309 rc_powercolor_real_angel rc_pix=
elview_new rc_pixelview_mk12 rc_pixelview_002t rc_pixelview rc_pinnacle_pct=
v_hd rc_pinnacle_grey rc_pinnacle_color rc_pine64 rc_pctv_sedna rc_odroid r=
c_npgtech rc_norwood rc_nec_terratec_cinergy_xs rc_nebula rc_mygica_utv3 rc=
_msi_tvanywhere_plus rc_msi_tvanywhere rc_msi_digivox_iii rc_msi_digivox_ii=
 rc_minix_neo rc_medion_x10_or2x rc_medion_x10_digitainer rc_medion_x10 rc_=
mecool_kiii_pro rc_mecool_kii_pro rc_manli rc_lme2510 rc_leadtek_y04g0051 r=
c_kworld_plus_tv_analog rc_kworld_pc150u rc_kworld_315u rc_khamsin rc_khada=
s rc_kaiomy rc_it913x_v2 rc_it913x_v1 rc_iodata_bctv7e rc_imon_rsc rc_imon_=
pad rc_imon_mce rc_hisi_tv_demo rc_hisi_poplar rc_hauppauge rc_gotview7135 =
rc_genius_tvgo_a11mce rc_geekbox rc_gadmei_rm008z rc_fusionhdtv_mce rc_flyv=
ideo rc_flydvb rc_eztv rc_evga_indtube rc_encore_enltv2 rc_encore_enltv_fm5=
3 rc_encore_enltv rc_em_terratec rc_dvico_portable rc_dvico_mce rc_dvbsky r=
c_dtt200u rc_dreambox rc_dntv_live_dvbt_pro
[   56.012798]  rc_dntv_live_dvb_t rc_dm1105_nec rc_digittrade rc_digitalno=
w_tinytwin rc_dib0700_rc5 rc_dib0700_nec rc_delock_61959 rc_d680_dmb rc_ct_=
90405 rc_cinergy_1400 rc_cinergy rc_budget_ci_old rc_behold_columbus rc_beh=
old rc_beelink_mxiii rc_beelink_gs1 rc_azurewave_ad_tu700 rc_avertv_303 rc_=
avermedia_rm_ks rc_avermedia_m733a_rm_k6 rc_avermedia_m135a rc_avermedia_dv=
bt rc_avermedia_cardbus rc_avermedia_a16d rc_avermedia rc_ati_x10 rc_ati_tv=
_wonder_hd_600 rc_asus_ps3_100 rc_asus_pc39 rc_astrometa_t2hybrid rc_apac_v=
iewcomp rc_anysee rc_alink_dtu_m rc_adstech_dvb_t_pci or51211 or51132 nxt20=
0x mxl692 mn88473 mn88472 lgs8gxx ir_kbd_i2c ingenic_rng gpio_ir_tx gpio_ir=
_recv ecdh_generic ds3000 drxk drxd drx39xyj drm dib9000 dib8000 dib7000p d=
ib7000m dib3000mc cxd2880_spi cx24120 cx24117 cx24116 cfg80211 bcm3510 au85=
22_dig zl10353 zl10039 zl10036 zd1301_demod ves1x93 ves1820 v4l2_dv_timings=
 tuner_types tua9001 tua6100 ts2020 tea5767 tea5761 tda9887 tda8290 tda827x=
 tda826x tda8261 tda8083 tda665x tda18271c2dd tda18271
[   56.101318]  tda18250 tda18218 tda18212 tda10086 tda10023 tda10021 tc905=
22 stv6111 stv6110x stv6110 stv0910 stv090x stv0900 stv0367 stv0297 stv0288=
 stb6100 stb6000 stb0899 si21xx sha256 s921 s5h1432 s5h1420 s5h1411 s5h1409=
 rng_core rc_core r820t qt1010 qm1d1c0042 qm1d1b0004 pwm_jz4740 nxt6000 mxl=
5xx mxl5007t mxl5005s mxl301rf mt352 mt312 mt2266 mt2131 mt20xx mt2063 mt20=
60 mn88443x mc44s803 mc mb86a20s mb86a16 max2165 m88rs6000t m88rs2000 lnbp2=
2 lnbp21 lnbh29 lnbh25 libaes lgs8gl5 lgdt330x lgdt3305 lg2160 ledtrig_came=
ra ledtrig_backlight l64781 kpp ix2505v itd1000 it913x isl6423 isl6421 isl6=
405 horus3a helene gpio_keys firmware_class fc0013 fc0012 fc0011 ecc ec100 =
dvb_pll dvb_core drm_panel_orientation_quirks dibx000_common dib3000mb dib0=
090 dib0070 cxd2880 cxd2841er cxd2820r cxd2099 cx24123 cx24113 cx24110 cx22=
702 cx22700 cmac cec brcmutil au8522_common atbm8830 ascot2e af9033 a8293
[   56.268085] CPU: 0 UID: 0 PID: 36 Comm: kworker/u4:2 Not tainted 7.1.6-1=
 #1 PREEMPT
[   56.275401] Hardware name: img,ci20
[   56.278840] Workqueue: events_unbound deferred_probe_work_func
[   56.284648] Stack : 00000000 8017d63c 83fa5a4c 00000004 00000000 0000000=
0 00000000 00000000
[   56.292995]         00000000 00000000 00000000 00000000 00000000 0000000=
1 83fa5a00 de998ae0
[   56.301315]         83fa5a98 00000000 00000000 00000000 00000038 807c2d4=
4 00000000 00000000
[   56.309634]         00000000 00000078 808725a0 6e756f62 00000000 80aa000=
0 00000000 809fa27c
[   56.317955]         00000000 80a15b38 83fa5b3c c0488b60 00000000 804f783=
c 00edc85f 00edc89f
[   56.326275]         ...
[   56.328669] Call Trace:
[   56.331094] [<80115ee4>] show_stack+0xb4/0x15c
[   56.335521] [<8010e460>] dump_stack_lvl+0x4c/0x7c
[   56.340200] [<8012a5b8>] __warn+0xb8/0x110
[   56.344272] [<8012a6cc>] warn_slowpath_fmt+0xbc/0x14c
[   56.349389] [<c0488b60>] drm_bridge_get+0x58/0x6c [drm]
[   56.354928] [<c04898b8>] drm_bridge_attach+0x80/0x208 [drm]
[  !56.360397] [<c08ff740>] ingenic_drm_bind.constprop.0+0x68c/0xa18 [ingen=
ic_drm]
[   56.367362] [<8055f148?] platform_probe+0x50/0x8c
[   56.372007] [<8055ccc8>] really_probe+0x164/0x2c4
[   56.376687] [<8055d0f0>] driver_probe_device+0x40/0xcc
[   56.381801] [<8055d1d8>] __device_attach_driver+0x5c/0xdc
[   56.387174] [<8055abb4>] bus_for_each_drv+0xc8/0xf0
[   56.392027] [<8055cb08>] __device_attach+0xe8/0x13c
[   56.396880] [<8055d4e4>] device_initial_probe+0x40/0x6c
[   56.402080] [<8055b7c8>] bus_probe_device+0x34/0xbc
[   56.406933] [<8055c62c>] deferred_probe_work_func+0xb0/0xc8
[   56.412482] [<801448b0>] process_scheduled_works+0x228/0x304
[   56.418114] [<80144be0>] worker_thread+0x254/0x2c4
[   56.422880] [<8014d798>] kthread+0x150/0x158
[   56.427125] [<801108ec>] ret_from_kernel_thread+0x14/0x1c
[   56.432501]
[   56.434018] ---[ end trace 0000000000000000 ]---

Does anyone know how to fix it?

best regards
 Waldemar


