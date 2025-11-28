# Sound-DNNs-Brain-Benchmark

A project to compare pre-trained audio models on a 600-sound dataset by extracting embeddings and evaluating brain alignment (RSA/CCN against MEG/iEEG targets).

## Project Structure

```
Sound-DNNs-Brain-Benchmark/
├── Data/
│   └── stimuli/
│       ├── audio/
│       │   └── common_unique_sets_v03_RMSnorm_Silence/  # 600+ WAV files
│       └── text/
│           └── [Excel files with labels and metadata]
├── script/
│   ├── models/
│   │   ├── extract_PANNs.ipynb
│   │   ├── extract_SoundNet.ipynb
│   │   ├── extract_COALA.ipynb
│   │   ├── extract_AST.ipynb
│   │   ├── extract_PaSST.ipynb
│   │   ├── extract_HTSAT.ipynb
│   │   ├── extract_Wav2Vec2.ipynb
│   │   ├── extract_HuBERT.ipynb
│   │   ├── extract_WavLM.ipynb
│   │   ├── extract_BEATs.ipynb
│   │   ├── extract_CLAP.ipynb
│   │   ├── extract_AudioCLIP.ipynb
│   │   ├── extract_ImageBind.ipynb
│   │   └── README.md
│   └── utils/
│       └── [utility scripts]
├── results/
│   └── embeddings/  # Extracted embeddings will be saved here
├── AudioDNNs_Benchmarks/  # Conda environment (not in git)
├── requirements.txt
└── README.md
```

## Setup

1. Create and activate the conda environment:
   ```bash
   # Create conda environment (already created as AudioDNNs_Benchmarks)
   conda create -n AudioDNNs_Benchmarks python=3.9 -y
   
   # Activate conda environment
   conda activate AudioDNNs_Benchmarks
   ```

2. Install dependencies:
   ```bash
   pip install --upgrade pip
   pip install -r requirements.txt
   ```

3. Open a model extraction notebook:
   ```bash
   jupyter notebook script/models/extract_Wav2Vec2.ipynb  # Example
   ```
   
   See `script/models/README.md` for a list of all available models.

**Note on dependencies**: Different audio models may have conflicting dependencies. If you encounter conflicts, consider:
- Installing models one at a time and testing
- Using separate conda environments for different model families
- Pinning specific versions in `requirements.txt` as you add models

## Workflow

1. **Extract Embeddings**: 
   - Navigate to `script/models/` and open the notebook for the model you want to use
   - Each notebook is self-contained and includes:
     - Model setup instructions
     - Embedding extraction code (to be implemented)
     - Saving functionality
   - See `script/models/README.md` for model-specific details

2. **Brain Alignment Analysis**: Evaluate embeddings against MEG/iEEG targets using RSA/CCN methods (to be implemented)

## Data

- Audio files: `Data/stimuli/audio/common_unique_sets_v03_RMSnorm_Silence/`
- Labels and metadata: `Data/stimuli/text/`

## Results

Extracted embeddings are saved in `results/embeddings/` with:
- `{model_name}_embeddings.npy`: NumPy array of embeddings
- `{model_name}_metadata.csv`: File names and paths
- `{model_name}_summary.txt`: Summary statistics

