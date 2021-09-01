import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

ScrollController scrollController;

Color mainColor = Color(0xFF063039);
Color subColor = Color(0xFFC8AA6E);
Color caughtColor = Colors.red;

RxBool pressAttention = false.obs;
bool draggableState = false;
DateTime date = DateTime.now();

String champIcon = "assets/images/champion_icon.jpg";
String dragging1;
String dragging2;
String dragging3;
String champName;
String banTemp;
String targetTeam;
String draggingTeam;
String dropdownValue = null;
RxString testStr = ''.obs;

int tempNum;
int trigger;

double width;
double height;
double displayHeight;
double displayWidth;
double displayRatio;

List topList = Champions.top;
List jugList = Champions.jug;
List midList = Champions.mid;
List botList = Champions.bot;
List supList = Champions.sup;
List topPlayerList = Champions.top_player;
List jugPlayerList = Champions.jug_player;
List midPlayerList = Champions.mid_player;
List botPlayerList = Champions.bot_player;
List supPlayerList = Champions.sup_player;

class Champions {
  Future _listAssets(context) async {
    // Load as String
    final manifestContent =
        await DefaultAssetBundle.of(context).loadString('AssetManifest.json');
    // Decode to Map
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    // Filter by path
    final filtered = manifestMap.keys
        .where((path) => path.startsWith('assets/images/champions/SUP/'))
        .toList();
  }

  static List<String> top = [
    "assets/images/champions/TOP/RiotX_ChampionList_aatrox.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_akali.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_camille.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_chogath.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_darius.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_drmundo.png",
    "assets/images/champions/TOP/RiotX_ChampionList_fiora.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_gangplank.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_garen.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_gnar.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_gwen.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_heimerdinger.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_illaoi.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_irelia.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_jax.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_jayce.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_kayle.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_kennen.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_kled.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_malaphite.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_maokai.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_monkeyking.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_mordekaiser.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_nasus.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_ornn.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_poppy.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_quinn.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_renekton.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_rengar.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_riven.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_sett.png",
    "assets/images/champions/TOP/RiotX_ChampionList_shen.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_teemo.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_tryndamere.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_urgot.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_vladimir.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_volibear.png",
    "assets/images/champions/TOP/RiotX_ChampionList_yorick.jpg",
  ];

  static List<String> jug = [
    "assets/images/champions/JUG/RiotX_ChampionList_amumu.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_diana.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_elise.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_evelynn.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_fiddlesticks.jpeg",
    "assets/images/champions/JUG/RiotX_ChampionList_gragas.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_graves-cigar.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_hecarim.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_ivern.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_jarvaniv.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_karthus.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_kayn.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_khazix.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_kindred.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_leesin.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_lillia.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_masteryi.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_nidalee.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_nunu.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_olaf.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_rammus.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_reksai.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_rumble.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_sejuani.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_shaco.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_shyvana.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_skarner.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_trundle.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_udyr.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_vi.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_viego.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_warwick.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_xinzhao.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_zac.jpg",
  ];

  static List<String> mid = [
    "assets/images/champions/MID/RiotX_ChampionList_ahri.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_anivia.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_annie.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_aurelionsol.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_azir.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_cassiopeia.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_corki.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_ekko.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_fizz.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_galio.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_ialiyah.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_kassadin.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_katarina.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_leblanc.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_lissandra.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_malzahar.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_neeko.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_nocturne.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_orianna.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_pantheon.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_qiyana.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_ryze.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_sylas.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_talon.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_twistedfate.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_veigar.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_viktor.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_xeratth.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_yasuo.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_yone.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_zed.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_zoe.jpg",
  ];

  static List<String> bot = [
    "assets/images/champions/BOT/RiotX_ChampionList_aphelios.jpg",
    "assets/images/champions/BOT/RiotX_ChampionList_ashe.jpg",
    "assets/images/champions/BOT/RiotX_ChampionList_caitlyn.jpg",
    "assets/images/champions/BOT/RiotX_ChampionList_draven.jpg",
    "assets/images/champions/BOT/RiotX_ChampionList_ezreal.jpg",
    "assets/images/champions/BOT/RiotX_ChampionList_jhin.jpg",
    "assets/images/champions/BOT/RiotX_ChampionList_jinx.jpg",
    "assets/images/champions/BOT/RiotX_ChampionList_kaisa.jpg",
    "assets/images/champions/BOT/RiotX_ChampionList_kalista.jpg",
    "assets/images/champions/BOT/RiotX_ChampionList_kogmaw.jpg",
    "assets/images/champions/BOT/RiotX_ChampionList_lucian.jpg",
    "assets/images/champions/BOT/RiotX_ChampionList_missfortune.jpg",
    "assets/images/champions/BOT/RiotX_ChampionList_samira.jpg",
    "assets/images/champions/BOT/RiotX_ChampionList_sivir.jpg",
    "assets/images/champions/BOT/RiotX_ChampionList_tristana.jpg",
    "assets/images/champions/BOT/RiotX_ChampionList_twitch.jpg",
    "assets/images/champions/BOT/RiotX_ChampionList_varus.jpg",
    "assets/images/champions/BOT/RiotX_ChampionList_vayne.jpg",
    "assets/images/champions/BOT/RiotX_ChampionList_xayah.jpg",
    "assets/images/champions/BOT/RiotX_ChampionList_ziggs.jpg",
  ];

  static List<String> sup = [
    "assets/images/champions/SUP/RiotX_ChampionList_alistar.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_bard.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_blitzcrank.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_brand.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_braum.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_janna.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_karma.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_leona.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_lulu.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_lux.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_morgana.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_nami.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_nautilus.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_pyke.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_rakan.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_Rell_v2.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_senna.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_seraphine.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_sona.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_soraka.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_swain.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_tahmkench.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_taric.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_thresh.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_velkoz.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_yuumi.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_zilean.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_zyra.jpg",
  ];

  static List<String> top_player = [
    "assets/images/champions/TOP/RiotX_ChampionList_aatrox_player.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_akali_player.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_camille_player.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_chogath_player.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_darius_player.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_drmundo_player.png",
    "assets/images/champions/TOP/RiotX_ChampionList_fiora_player.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_gangplank_player.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_garen_player.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_gnar_player.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_gwen_player.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_heimerdinger_player.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_illaoi_player.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_irelia_player.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_jax_player.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_jayce_player.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_kayle_player.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_kennen_player.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_kled_player.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_malaphite_player.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_maokai_player.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_monkeyking_player.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_mordekaiser_player.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_nasus_player.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_ornn_player.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_poppy_player.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_quinn_player.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_renekton_player.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_rengar_player.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_riven_player.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_sett_player.png",
    "assets/images/champions/TOP/RiotX_ChampionList_shen_player.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_teemo_player.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_tryndamere_player.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_urgot_player.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_vladimir_player.jpg",
    "assets/images/champions/TOP/RiotX_ChampionList_volibear_player.png",
    "assets/images/champions/TOP/RiotX_ChampionList_yorick_player.jpg",
  ];

  static List<String> jug_player = [
    "assets/images/champions/JUG/RiotX_ChampionList_amumu_player.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_diana_player.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_elise_player.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_evelynn_player.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_fiddlesticks_player.jpeg",
    "assets/images/champions/JUG/RiotX_ChampionList_gragas_player.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_graves-cigar_player.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_hecarim_player.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_ivern_player.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_jarvaniv_player.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_karthus_player.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_kayn_player.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_khazix_player.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_kindred_player.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_leesin_player.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_lillia_player.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_masteryi_player.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_nidalee_player.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_nunu_player.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_olaf_player.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_rammus_player.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_reksai_player.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_rumble_player.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_sejuani_player.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_shaco_player.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_shyvana_player.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_skarner_player.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_trundle_player.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_udyr_player.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_vi_player.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_viego_player.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_warwick_player.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_xinzhao_player.jpg",
    "assets/images/champions/JUG/RiotX_ChampionList_zac_player.jpg",
  ];

  static List<String> mid_player = [
    "assets/images/champions/MID/RiotX_ChampionList_ahri_player.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_anivia_player.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_annie_player.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_aurelionsol_player.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_azir_player.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_cassiopeia_player.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_corki_player.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_ekko_player.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_fizz_player.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_galio_player.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_ialiyah_player.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_kassadin_player.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_katarina_player.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_leblanc_player.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_lissandra_player.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_malzahar_player.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_neeko_player.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_nocturne_player.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_orianna_player.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_pantheon_player.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_qiyana_player.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_ryze_player.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_sylas_player.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_talon_player.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_twistedfate_player.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_veigar_player.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_viktor_player.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_xeratth_player.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_yasuo_player.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_yone_player.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_zed_player.jpg",
    "assets/images/champions/MID/RiotX_ChampionList_zoe_player.jpg",
  ];

  static List<String> bot_player = [
    "assets/images/champions/BOT/RiotX_ChampionList_aphelios_player.jpg",
    "assets/images/champions/BOT/RiotX_ChampionList_ashe_player.jpg",
    "assets/images/champions/BOT/RiotX_ChampionList_caitlyn_player.jpg",
    "assets/images/champions/BOT/RiotX_ChampionList_draven_player.jpg",
    "assets/images/champions/BOT/RiotX_ChampionList_ezreal_player.jpg",
    "assets/images/champions/BOT/RiotX_ChampionList_jhin_player.jpg",
    "assets/images/champions/BOT/RiotX_ChampionList_jinx_player.jpg",
    "assets/images/champions/BOT/RiotX_ChampionList_kaisa_player.jpg",
    "assets/images/champions/BOT/RiotX_ChampionList_kalista_player.jpg",
    "assets/images/champions/BOT/RiotX_ChampionList_kogmaw_player.jpg",
    "assets/images/champions/BOT/RiotX_ChampionList_lucian_player.jpg",
    "assets/images/champions/BOT/RiotX_ChampionList_missfortune_player.jpg",
    "assets/images/champions/BOT/RiotX_ChampionList_samira_player.jpg",
    "assets/images/champions/BOT/RiotX_ChampionList_sivir_player.jpg",
    "assets/images/champions/BOT/RiotX_ChampionList_tristana_player.jpg",
    "assets/images/champions/BOT/RiotX_ChampionList_twitch_player.jpg",
    "assets/images/champions/BOT/RiotX_ChampionList_varus_player.jpg",
    "assets/images/champions/BOT/RiotX_ChampionList_vayne_player.jpg",
    "assets/images/champions/BOT/RiotX_ChampionList_xayah_player.jpg",
    "assets/images/champions/BOT/RiotX_ChampionList_ziggs_player.jpg",
  ];

  static List<String> sup_player = [
    "assets/images/champions/SUP/RiotX_ChampionList_alistar_player.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_bard_player.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_blitzcrank_player.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_brand_player.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_braum_player.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_janna_player.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_karma_player.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_leona_player.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_lulu_player.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_lux_player.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_morgana_player.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_nami_player.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_nautilus_player.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_pyke_player.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_rakan_player.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_Rell_v2_player.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_senna_player.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_seraphine_player.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_sona_player.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_soraka_player.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_swain_player.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_tahmkench_player.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_taric_player.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_thresh_player.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_velkoz_player.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_yuumi_player.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_zilean_player.jpg",
    "assets/images/champions/SUP/RiotX_ChampionList_zyra_player.jpg",
  ];
}

class leagues {
  static List<String> league_lck = [
    "assets/images/league_picture/lck/Afreeca Freecs.png",
    "assets/images/league_picture/lck/DRX.png",
    "assets/images/league_picture/lck/DWG KIA.png",
    "assets/images/league_picture/lck/Fredit BRION.png",
    "assets/images/league_picture/lck/Gen.G.png",
    "assets/images/league_picture/lck/Hanwha Life Esports.png",
    "assets/images/league_picture/lck/kt Rolster.png",
    "assets/images/league_picture/lck/Livv SANDBOX.png",
    "assets/images/league_picture/lck/NongShim REDFORCE.png",
    "assets/images/league_picture/lck/T1.png"
  ];
}

List<String> lines = [
  'assets/images/lines/top.svg',
  'assets/images/lines/jug.svg',
  'assets/images/lines/mid.svg',
  'assets/images/lines/bot.svg',
  'assets/images/lines/sup.svg'
];

List<String> leaguesPng = [
  'assets/images/SVG/league2/lck.png',
  'assets/images/SVG/league2/lpl.png',
  'assets/images/SVG/league2/lec.png',
  'assets/images/SVG/league2/lcs.png',
  'assets/images/SVG/league2/ljl.png',
  'assets/images/SVG/league2/tcl.png',
  'assets/images/SVG/league2/cblol.png',
  'assets/images/SVG/league2/lco.png',
  'assets/images/SVG/league2/lla.png',
  'assets/images/SVG/league2/lcl.png'
];
