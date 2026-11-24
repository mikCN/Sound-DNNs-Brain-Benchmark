#!/usr/bin/env bash
# Copy key analysis figures into manuscript/figures/ for Overleaf upload.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
RUN="${ROOT}/results/alignment/RSA_SoundDNNs_full"
OUT="${ROOT}/manuscript/figures"
mkdir -p "$OUT"

copy() {
  local src="$1" dst="$2"
  if [[ -f "$src" ]]; then
    cp "$src" "$OUT/$dst"
    echo "  + $dst"
  else
    echo "  skip (missing): $src" >&2
  fi
}

echo "Syncing figures from $RUN ..."
# Main RSA
for f in alignment_curves_all_mc_sig.png leaderboard_top12.png alignment_scorecard.png \
  alignment_scorecard_multi_window.png temporal_windows_overview.png peak_timing_top12.png \
  baseline_lift_vs_mtf_hires.png family_comparison.png family_rsa_timecourse.png \
  family_rsa_window_timecourse.png family_rsa_mc_vs_raw.png leaderboard_mc_vs_raw.png \
  family_rsa_timecourse_raw.png; do
  copy "$RUN/figures/$f" "$f"
done

# Layer-wise
LW="$RUN/layerwise/figures"
for f in layer_depth_profiles_top6.png layer_depth_multiwindow_all_models.png \
  layer_best_per_window_heatmap.png layer_heatmap_grid_all_models.png \
  layer_rsa_class_cluster_heatmap.png layer_rsa_class_overlay_all_models.png; do
  copy "$LW/$f" "$f"
done

# Regression
REG="$RUN/layerwise/regression"
for f in variance_partition_univariate_primary.png variance_partition_univariate_over_time.png \
  variance_partition_univariate_by_window.png variance_partition_venn_over_windows.png \
  split_level_univariate.png variance_decomposition_bars.png variance_decomposition_main.png \
  peak_latency_univariate.png; do
  copy "$REG/$f" "$f"
done

echo "Done. $(ls -1 "$OUT"/*.png 2>/dev/null | wc -l | tr -d ' ') PNG files in manuscript/figures/"
